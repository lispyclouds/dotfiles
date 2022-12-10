(ns general.commit
  (:require [babashka.fs :as fs]
            [babashka.process :as p]
            [clojure.edn :as edn]
            [clojure.java.io :as io]
            [clojure.string :as str]))

(import '[java.io PushbackReader])

(def cache-path (str (fs/expand-home "~/.cache/commit/cache.edn")))

(defn read-edn
  [path]
  (if (fs/exists? path)
    (with-open [r (io/reader path)]
      (edn/read (PushbackReader. r)))
    {}))

(defn write-cache
  [data]
  (fs/create-dirs (fs/expand-home "~/.cache/commit"))
  (with-open [w (io/writer cache-path)]
    (binding [*print-length* false
              *out*          w]
      (pr data))))

(defn get-authors
  []
  (let [default {"rd" {:name  "Rahul De"
                       :email "rahul080327@gmail.com"}}
        conf    (read-edn (str (fs/expand-home "~/.config/commit/conf.edn")))]
    (into default (:authors conf))))

(defn exec
  [cmd]
  (-> cmd
      (p/sh)
      (p/check)
      (:out)
      (str/trim)))

(defn prompt
  [message default]
  (printf "%s%s: "
          message
          (if default
            (format "[%s]" default)
            ""))
  (flush)
  (let [answer (read-line)]
    (if (empty? answer)
      (or default "")
      answer)))

(defn bail!
  [msg]
  (binding [*out* *err*]
    (println msg))
  (System/exit 1))

(defn primary-author?
  [authors email short-name]
  (= email (get-in authors [short-name :email])))

(defn git-status
  []
  (try
    (exec "git status --porcelain")
    (catch Exception _ "")))

(defn validate-author
  [authors short-name]
  (when-not (contains? authors short-name)
    (bail! (format "Unrecognised author %s. Choose from: %s"
                   short-name
                   (str/join ", " (keys authors))))))

(defn make-co-author-msg
  [authors co-authors]
  (let [email (exec "git config --get user.email")]
    (->> co-authors
         (filter #(not (primary-author? authors email %)))
         (map #(authors %))
         (map #(format "Co-authored-by: %s <%s>"
                       (% :name)
                       (% :email)))
         (str/join \newline))))

(defn -main
  [{:keys [opts]}]
  (when (empty? (git-status))
    (bail! "Not a valid git repo or no changes to commit."))

  (let [{:keys [no-cache]}         opts
        {:keys [story co-authors]} (if no-cache
                                     {}
                                     (read-edn cache-path))
        authors                    (get-authors)
        story                      (prompt "Story/Feature" story)
        co-authors                 (prompt "Co-authors (short-names separated by ,)" co-authors)
        co-authors                 (filter seq (str/split co-authors #"\s*,\s*"))
        _ (run! #(validate-author authors %) co-authors)
        commit-message             (prompt "Message" nil)]
    (try
      (exec (format "git commit --cleanup=verbatim -m \"[%s] %s\n\n%s\""
                    story
                    commit-message
                    (make-co-author-msg authors co-authors)))
      (when-not no-cache
        (write-cache {:story story :co-authors (str/join ", " co-authors)}))
      (catch Exception ex
        (-> ex
            (ex-data)
            (:out)
            (bail!))))))

(comment
  (write-cache {:foo "bar"}))

(ns general.commit
  (:require [babashka.fs :as fs]
            [babashka.process :as p]
            [clojure.edn :as edn]
            [clojure.java.io :as io]
            [clojure.string :as str]))

(import '[java.io PushbackReader])

(def cache-path (str (fs/expand-home "~/.cache/commit/cache.edn")))

(defn bail!
  [msg]
  (binding [*out* *err*]
    (println msg))
  (System/exit 1))

(defn read-edn
  [path]
  (if (fs/exists? path)
    (with-open [r (io/reader path)]
      (try
        (edn/read (PushbackReader. r))
        (catch Throwable _ {})))
    {}))

(defn write-cache
  [data]
  (fs/create-dirs (fs/expand-home "~/.cache/commit"))
  (with-open [w (io/writer cache-path)]
    (binding [*print-length* false
              *out*          w]
      (pr data))))

(defn exec
  [cmd]
  (-> cmd
      (p/shell {:out :string})
      (:out)
      (str/trim)))

(defn get-co-authors
  []
  (let [default {"rahul080327@gmail.com" {:name "Rahul De"}}
        conf    (read-edn (str (fs/expand-home "~/.config/commit/conf.edn")))
        authors (into default (:authors conf))]
    (->> (exec "git config --get user.email")
         (dissoc authors)
         (map (fn [[email {:keys [name]}]]
                (format "%s <%s>"
                        email
                        name))))))

(defn prompt
  [message default]
  (try
    (let [cmd ["gum" "input" "--placeholder" message]
          cmd (if default
                (conj cmd "--value" default)
                cmd)]
      (exec cmd))
    (catch Throwable _
      (bail! "Error reading input"))))

(defn choose-from
  [message options selected]
  (println message)
  (try
    (let [cmd ["gum" "choose" "--no-limit"]
          cmd (if (seq selected)
                (->> selected
                     (str/join ",")
                     (vector "--selected")
                     (into cmd))
                cmd)]
      (->> (into cmd options)
           (exec)
           (str/split-lines)))
    (catch Throwable _
      (bail! "Error in choosing"))))

(defn check-git
  []
  (try
    (when (empty? (exec "git status --porcelain"))
      (bail! "No changes to commit"))
    (catch Throwable _
      (bail! "Error running git or not a valid git repo"))))

(defn make-co-author-msg
  [co-authors]
  (->> co-authors
       (map #(format "Co-authored-by: %s" %))
       (str/join \newline)))

(defn -main
  [{:keys [opts]}]
  (check-git)
  (let [{:keys [no-cache]}         opts
        {:keys [story co-authors]} (if no-cache
                                     {}
                                     (read-edn cache-path))
        story                      (prompt "Story/Feature" story)
        co-authors                 (choose-from "Co-author(s)"
                                                (get-co-authors)
                                                co-authors)
        commit-message             (prompt "Message" nil)]
    (try
      (exec (format "git commit --cleanup=verbatim -m \"[%s] %s\n\n%s\""
                    story
                    commit-message
                    (make-co-author-msg co-authors)))
      (when-not no-cache
        (write-cache {:story story :co-authors co-authors}))
      (catch Throwable ex
        (-> ex
            (ex-data)
            (:out)
            (bail!))))))

(comment
  (write-cache {:foo "bar"}))

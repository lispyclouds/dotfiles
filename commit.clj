#!/usr/bin/env bb

(require '[babashka.process :as p]
         '[clojure.string :as str])

(def authors
  {"rd" {:name  "Rahul De"
         :email "rahul080327@gmail.com"}})

(defn exec
  [cmd]
  (-> cmd
      (p/sh)
      (p/check)
      (:out)
      (str/trim)))

(defn prompt
  [message]
  (printf "%s: " message)
  (flush)
  (read-line))

(defn bail!
  [msg]
  (binding [*out* *err*]
    (println msg))
  (System/exit 1))

(defn primary-author?
  [email short-name]
  (= email (get-in authors [short-name :email])))

(defn git-status
  []
  (try
    (exec "git status --porcelain")
    (catch Exception _ "")))

(defn validate-author
  [short-name]
  (when-not (contains? authors short-name)
    (bail! (format "Unrecognised author %s. Choose from: %s"
                   short-name
                   (str/join ", " (keys authors))))))

(defn make-co-author-msg
  [co-authors]
  (let [email (exec "git config --get user.email")]
    (->> co-authors
         (filter #(not (primary-author? email %)))
         (map #(authors %))
         (map #(format "Co-authored-by: %s <%s>"
                       (% :name)
                       (% :email)))
         (str/join \newline))))

(defn main
  []
  (when (empty? (git-status))
    (bail! "Not a valid git repo or no changes to commit."))

  (let [story      (prompt "Story/Feature")
        co-authors (prompt "Co-authors (short-names separated by ,)")
        co-authors (filter seq (str/split co-authors #"\s*,\s*"))
        _ (run! validate-author co-authors)
        message    (prompt "Message")]
    (exec (format "git commit --cleanup=verbatim -m \"[%s] %s\n\n%s\""
                  story
                  message
                  (make-co-author-msg co-authors)))))

(when (= *file* (System/getProperty "babashka.file"))
  (main)
  nil)

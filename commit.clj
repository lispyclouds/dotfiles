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

(defn primary-author?
  [short-name]
  (= (exec "git config --get user.email")
     (get-in authors [short-name :email])))

(defn bail!
  [msg]
  (binding [*out* *err*]
    (println msg))
  (System/exit 1))

(defn git-status
  []
  (exec "git status --porcelain"))

(defn git-repo?
  []
  (try
    (exec "git config --get remote.origin.url")
    true
    (catch Exception _ false)))

(defn validate-author
  [short-name]
  (when-not (contains? authors short-name)
    (bail! (format "Unrecognised author %s. Choose from: %s"
                   short-name
                   (str/join ", " (keys authors))))))

(defn make-co-author-msg
  [co-authors]
  (->> co-authors
       (filter #(not (primary-author? %)))
       (map #(authors %))
       (map #(format "Co-authored-by: %s <%s>"
                     (% :name)
                     (% :email)))
       (str/join \newline)))

(defn main
  []
  (when (empty? (git-status))
    (bail! "Nothing to commit"))

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

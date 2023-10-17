(ns general.zsh
  (:require
   [clojure.java.io :as io]
   [clojure.string :as s]))

(defn line->cmd
  [line]
  ^String
  (some->> (s/index-of line \;)
           inc
           (subs line)))

(defn -main
  []
  (with-open [rdr (io/reader (str (System/getProperty "user.home") "/.zsh_history"))]
    (let [lines (loop [[line & lines] (line-seq rdr)
                       uniq-cmds (transient #{})
                       uniq-lines (transient [])]
                  #_(println (format "Remaining: %d Unique: %d"
                                     (count lines)
                                     (count uniq-cmds)))
                  (if (nil? line)
                    (persistent! uniq-lines)
                    (let [cmd (line->cmd line)]
                      (if (uniq-cmds cmd)
                        (recur lines uniq-cmds uniq-lines)
                        (recur lines (conj! uniq-cmds cmd) (conj! uniq-lines line))))))]
      (doseq [line lines]
        (println line)))))

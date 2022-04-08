(ns bootstrap.common
  (:require [clojure.string :as s]))

(defn ->cmds
  [manager {:keys [cmd packages prep]}]
  (let [install-cmd (format "%s %s %s"
                            manager
                            cmd
                            (s/join " " packages))
        prep-cmds   (if prep
                      (mapv #(str manager " " %) prep)
                      [])]
    (conj prep-cmds install-cmd)
    [install-cmd]))

(defn get-cmds
  [config manager]
  (let [package-conf (config manager)]
    (when (nil? package-conf)
      (throw (Exception. (format "Unknown package manager: %s. Use one of %s"
                                 manager
                                 (s/join ", " (keys config))))))
    (->cmds manager package-conf)))

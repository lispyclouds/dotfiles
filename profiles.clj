{:user {:plugins      [[venantius/ultra "LATEST"]
                       [lein-exec "LATEST"]
                       [lein-cljfmt "LATEST"]]
        :repl-options {:prompt  #(str "\u001B[32m[\u001B[32m" % "\u001B[32m]\u001B[32mλ >>=\u001B[m ")
                       :welcome (println "All hail the λ")}}}

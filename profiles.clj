{:user {:plugins      [[venantius/ultra "LATEST"]
                       [lein-exec "LATEST"]
                       [lein-cljfmt "LATEST"]
                       [cider/cider-nrepl "LATEST"]]
        :dependencies [[cljfmt "LATEST"]
                       [mvxcvi/whidbey "LATEST"]]
        :repl-options {:prompt  #(str "\u001B[32m[\u001B[32m" % "\u001B[32m]\u001B[32m(λ)\u001B[m ")
                       :welcome (println "All hail the λ")}}}

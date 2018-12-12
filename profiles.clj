{:user {:dependencies [[nrepl "0.5.3"]]
        :repl-options {:prompt  #(str "\u001B[32m[\u001B[32m" % "\u001B[32m]\u001B[32m(λ)\u001B[m ")
                       :welcome (println "All hail the λ")}}}

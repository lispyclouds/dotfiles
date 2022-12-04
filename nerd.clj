#!/usr/bin/env bb

(require '[babashka.fs :as fs]
         '[cheshire.core :as json]
         '[clojure.java.io :as io]
         '[org.httpkit.client :as http])

(defn download-font
  [font]
  (println (str "Downloading " font))
  (let [assets          (-> @(http/get "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"
                                       {:as :stream})
                            :body
                            io/reader
                            (json/parse-stream true)
                            :assets)
        download-link   (->> assets
                             (filter #(= (str font ".zip") (:name %)))
                             first
                             :browser_download_url)
        zip-file        (str (fs/create-temp-file))
        _ (fs/delete-on-exit zip-file)
        download-stream (:body @(http/get download-link {:as :stream}))
        install-path    (str (fs/home) "/.local/share/fonts/NerdFonts")]
    (io/copy download-stream (io/file zip-file))
    (fs/create-dirs install-path)
    (fs/unzip zip-file install-path {:replace-existing true})))

(when (= *file* (System/getProperty "babashka.file"))
  (run! download-font ["FantasqueSansMono" "JetBrainsMono"]))

(comment
  (download-font "FantasqueSansMono"))

(ns general.nerd
  (:require [babashka.cli :as cli]
            [babashka.fs :as fs]
            [cheshire.core :as json]
            [clojure.java.io :as io]
            [clojure.string :as str]
            [org.httpkit.client :as http]))

(defn get-assets
  []
  (-> @(http/get "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"
                 {:as :stream})
      :body
      io/reader
      (json/parse-stream true)
      :assets))

(defn download-font
  [{:keys [args]}]
  (doseq [font args]
    (println (str "Downloading " font))
    (let [download-link   (->> (get-assets)
                               (filter #(= (str font ".zip") (:name %)))
                               first
                               :browser_download_url)
          zip-file        (str (fs/create-temp-file))
          _ (fs/delete-on-exit zip-file)
          download-stream (:body @(http/get download-link {:as :stream}))
          install-path    (str (fs/home) "/.local/share/fonts/NerdFonts")]
      (io/copy download-stream (io/file zip-file))
      (fs/create-dirs install-path)
      (fs/unzip zip-file install-path {:replace-existing true}))))

(defn list-fonts
  [& _]
  (->> (get-assets)
       (map :name)
       (map #(str/replace % #"(.zip)" ""))
       (run! println)))

(defn -main
  [opts]
  (let [table [{:cmds ["download"] :fn download-font}
               {:cmds ["list"] :fn list-fonts}]]
    (cli/dispatch table opts)))

(comment
  (download-font "FantasqueSansMono")

  (list-fonts))

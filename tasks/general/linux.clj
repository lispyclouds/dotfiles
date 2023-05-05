(ns general.linux
  (:require
   [babashka.cli :as cli]
   [babashka.fs :as fs]
   [babashka.http-client :as http]
   [cheshire.core :as json]
   [clojure.java.io :as io]
   [clojure.string :as str])
  (:import
   [java.util.concurrent Executors]))

(def downloads
  {:nerd-fonts {:repo "ryanoasis/nerd-fonts"
                :location (fs/expand-home "~/.local/share/fonts/NerdFonts")}
   :themes {:repo "catppuccin/gtk"
            :location (fs/expand-home "~/.themes")}})

(defn get-assets
  [repo]
  (-> (http/get (format "https://api.github.com/repos/%s/releases/latest" repo)
                {:as :stream})
      :body
      io/reader
      (json/parse-stream true)
      :assets))

(defn download
  [repo location item]
  (let [download-link (->> (get-assets repo)
                           (filter #(= (str item ".zip") (:name %)))
                           first
                           :browser_download_url)
        zip-file (str (fs/create-temp-file))
        _ (fs/delete-on-exit zip-file)
        download-stream (:body (http/get download-link {:as :stream}))]
    (println "Downloading" item "from" download-link)
    (io/copy download-stream (io/file zip-file))
    (fs/create-dirs location)
    (println "Extracting" item)
    (fs/unzip zip-file location {:replace-existing true})
    (println item "installed")))

(defn download-all
  [repo location items]
  (let [executor (Executors/newVirtualThreadPerTaskExecutor)]
    (->> items
         (map #(fn [] (download repo location %)))
         (.invokeAll executor)
         (run! deref))))

(defn ls
  [repo]
  (->> (get-assets repo)
       (eduction (map :name)
                 (map #(str/replace % #"(.zip)" "")))
       (run! println)))

(defn get-download-meta
  [args]
  (-> args
      first
      keyword
      downloads))

(defn dispatch-download
  [{:keys [args]}]
  (let [{:keys [repo location]} (get-download-meta args)]
    (download-all repo location (rest args))))

(defn dispatch-ls
  [{:keys [args]}]
  (let [{:keys [repo]} (get-download-meta args)]
    (ls repo)))

(defn -main
  [opts]
  (let [table [{:cmds ["download"] :fn dispatch-download}
               {:cmds ["ls"] :fn dispatch-ls}]]
    (cli/dispatch table opts)))

(comment
  (download "ryanoasis/nerd-fonts"
            (fs/expand-home "~/.local/share/fonts/NerdFonts")
            ["JetBrainsMono"])

  (ls "ryanoasis/nerd-fonts")

  (ls "catppuccin/gtk")

  (get-assets "catppuccin/gtk"))

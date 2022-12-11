(ns general.linux
  (:require [babashka.cli :as cli]
            [babashka.fs :as fs]
            [cheshire.core :as json]
            [clojure.java.io :as io]
            [clojure.string :as str]
            [org.httpkit.client :as http]))

(def downloads
  {:nerd-fonts {:repo     "ryanoasis/nerd-fonts"
                :location (fs/expand-home "~/.local/share/fonts/NerdFonts")}
   :themes     {:repo     "catppuccin/gtk"
                :location (fs/expand-home "~/.themes")}})

(defn get-assets
  [repo]
  (-> @(http/get (format "https://api.github.com/repos/%s/releases/latest" repo)
                 {:as :stream})
      :body
      io/reader
      (json/parse-stream true)
      :assets))

(defn download
  [repo location items]
  (doseq [item items]
    (println (str "Downloading " item))
    (let [download-link   (->> (get-assets repo)
                               (filter #(= (str item ".zip") (:name %)))
                               first
                               :browser_download_url)
          zip-file        (str (fs/create-temp-file))
          _ (fs/delete-on-exit zip-file)
          download-stream (:body @(http/get download-link {:as :stream}))]
      (io/copy download-stream (io/file zip-file))
      (fs/create-dirs location)
      (println (str "Extracting " item))
      (fs/unzip zip-file location {:replace-existing true}))))

(defn ls
  [repo]
  (->> (get-assets repo)
       (eduction (map :name)
                 (map #(str/replace % #"(.zip)" "")))
       (run! println)))

(defn get-download-meta
  [args]
  (get downloads (keyword (first args))))

(defn dispatch-download
  [{:keys [args]}]
  (let [{:keys [repo location]} (get-download-meta args)]
    (download repo location (rest args))))

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

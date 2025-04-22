ActiveStorageDownloadLogger::Engine.routes.draw do
    # Secure download route using signed blob ID
    get "/download/:signed_blob_id", to: "download_logs#download", as: :download
end
  
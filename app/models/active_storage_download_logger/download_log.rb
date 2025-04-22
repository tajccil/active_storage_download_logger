module ActiveStorageDownloadLogger
    class DownloadLog < ApplicationRecord
      belongs_to :blob, class_name: "ActiveStorage::Blob"
      belongs_to :user, optional: true
  
      validates :ip_address, :controller_name, presence: true
    end
  end
  
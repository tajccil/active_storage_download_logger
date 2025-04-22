class CreateDownloadLogs < ActiveRecord::Migration[7.0]
    def change
      create_table :active_storage_download_logger_download_logs do |t|
        t.references :blob, null: false, foreign_key: { to_table: :active_storage_blobs }
        t.references :user, foreign_key: true
        t.string :ip_address
        t.string :controller_name
        t.string :record_type
        t.bigint :record_id
        t.timestamps
      end
    end
  end
  
module ActiveStorageDownloadLogger
    class DownloadLogsController < ApplicationController
      include Rails.application.routes.url_helpers
  
      def download
        blob = ActiveStorage::Blob.find_signed(params[:signed_blob_id])
        file = blob.download
      
        # Log the download
        log_download(blob)
      
        send_data file,
                  filename: blob.filename.to_s,
                  content_type: blob.content_type,
                  disposition: "attachment"
      end
      
  
      private
  
      def log_download(blob)
        # Check for an existing log within the last 1 minute
        return if ActiveStorageDownloadLogger::DownloadLog.exists?(
          blob_id: blob.id,
          user_id: current_user&.id,
          ip_address: request.remote_ip,
          controller_name: params[:source],
          created_at: 1.minute.ago..Time.current
        )
      
        ActiveStorageDownloadLogger::DownloadLog.create!(
          blob: blob,
          user: current_user,
          ip_address: request.remote_ip,
          controller_name: params[:source],
          record_type: blob.attachments.first&.record_type,
          record_id: blob.attachments.first&.record_id
        )      
      rescue => e
        Rails.logger.warn "[DownloadLogger] Failed to log: #{e.message}"
      end
    end
  end
  
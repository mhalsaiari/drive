module Api
  module V1
    class BlobsController < ApplicationController

      def create
        if params[:id].present? && params[:data].present?
          if STORAGE_SERVICE.store_blob(params[:id], Base64.decode64(params[:data]))
            render json: { message: 'Blob stored successfully' }, status: :created
          else
            render json: { error: 'Failed to store blob' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'ID and data parameters are required' }, status: :bad_request
        end
      rescue ActiveRecord::RecordNotUnique
        render json: { error: 'Blob with the same ID already exists' }, status: :unprocessable_entity
      end

      def show
        blob_data = STORAGE_SERVICE.retrieve_blob(params[:id])
        if blob_data
          render json: { id: params[:id], data: Base64.strict_encode64(blob_data), size: blob_data.size, created_at: Time.now.utc }, status: :ok
        else
          render json: { error: 'Blob not found' }, status: :not_found
        end
      end
    end
  end
end

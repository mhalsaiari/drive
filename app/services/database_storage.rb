
class DatabaseStorage
  include StorageBackend

  def store_blob(id, data)
    blob = Blob.create(id: id, data: data)
    BlobData.create(blob: blob, data: data)
  end

  def retrieve_blob(id)
    blob_data = BlobData.find_by(blob_id: id)
    blob_data&.data
  end
end

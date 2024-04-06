require_relative '../lib/storage_backend'


class LocalStorage
  include StorageBackend

  def initialize(storage_directory)
    @storage_directory = storage_directory
  end

  def store_blob(id, data)
    
    file_path = file_path(id)
    File.open(file_path, 'wb') { |file| file.write(data) }

    Blob.create(id: id, data: data)
    
  end

  def retrieve_blob(id)
    File.read(file_path(id)) if File.exist?(file_path(id))
  end

  private

  def file_path(id)
    File.join(@storage_directory, "#{id}.bin")
  end
end

  
  
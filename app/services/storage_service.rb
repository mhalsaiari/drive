
class StorageService
    def initialize(storage_backend)
      @storage_backend = storage_backend
    end
  
    def store_blob(id, data)
      # Logic for storing blob using the specified storage backend
      @storage_backend.store_blob(id, data)
    end
  
    def retrieve_blob(id)
      # Logic for retrieving blob using the specified storage backend
      @storage_backend.retrieve_blob(id)
    end
  end
  
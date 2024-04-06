module StorageBackend
    def store_blob(id, data)
      raise NotImplementedError, "Subclasses must implement a store_blob method"
    end
  
    def retrieve_blob(id)
      raise NotImplementedError, "Subclasses must implement a retrieve_blob method"
    end
  end
  
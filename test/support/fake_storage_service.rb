# test/support/fake_storage_service.rb
class FakeStorageService
  def self.store_blob(id, data)
    # Implement fake logic to store blob
    true # Return true to simulate successful storage
  end

  def self.retrieve_blob(id)
    # Implement fake logic to retrieve blob
    "Fake Blob Data" # Return fake blob data
  end
end

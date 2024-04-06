# test/services/database_storage_test.rb
require 'test_helper'

class DatabaseStorageTest < ActiveSupport::TestCase
  def setup
    @storage = DatabaseStorage.new
  end

  test 'store_blob creates a blob and its data in the database' do
    id = '123'
    data = 'Hello, World!'

    assert_difference 'Blob.count' do
      assert_difference 'BlobData.count' do
        @storage.store_blob(id, data)
      end
    end

    blob = Blob.find_by(id: id)
    blob_data = BlobData.find_by(blob: blob)

    assert_not_nil blob
    assert_not_nil blob_data
    assert_equal data, blob_data.data
  end

  test 'retrieve_blob retrieves blob data from the database' do
    id = '123'
    data = 'Hello, World!'

    Blob.create(id: id)
    BlobData.create(blob_id: id, data: data)

    retrieved_data = @storage.retrieve_blob(id)

    assert_equal data, retrieved_data
  end

  test 'retrieve_blob returns nil if blob data is not found' do
    id = '123'
    retrieved_data = @storage.retrieve_blob(id)

    assert_nil retrieved_data
  end
end

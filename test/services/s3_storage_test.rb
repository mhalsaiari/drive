# test/services/s3_storage_test.rb
require 'test_helper'
require 'mocha/minitest'

class S3StorageTest < ActiveSupport::TestCase
  def setup
    @bucket_name = 'test_bucket'
    @storage = S3Storage.new(@bucket_name)
  end

  test 'store_blob sends PUT request to the correct URL' do
    id = '123'
    data = 'Hello, World!'

    Net::HTTP.any_instance.stubs(:start).returns(OpenStruct.new(code: '200'))

    assert @storage.store_blob(id, data)
  end

  test 'store_blob returns false if PUT request fails' do
    id = '123'
    data = 'Hello, World!'

    Net::HTTP.any_instance.stubs(:start).returns(OpenStruct.new(code: '500'))

    refute @storage.store_blob(id, data)
  end

  test 'retrieve_blob sends GET request to the correct URL' do
    id = '123'

    Net::HTTP.any_instance.stubs(:start).returns(OpenStruct.new(code: '200', body: 'Hello, World!'))

    assert_equal 'Hello, World!', @storage.retrieve_blob(id)
  end

  test 'retrieve_blob returns nil if GET request fails' do
    id = '123'

    Net::HTTP.any_instance.stubs(:start).returns(OpenStruct.new(code: '404'))

    assert_nil @storage.retrieve_blob(id)
  end
end

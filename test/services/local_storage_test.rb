# test/services/local_storage_test.rb
require 'test_helper'
require_relative '../../app/lib/storage_backend'



class LocalStorageTest < ActiveSupport::TestCase
  def setup
    @storage_directory = 'test_storage'
    Dir.mkdir(@storage_directory) unless Dir.exist?(@storage_directory)
    @storage = LocalStorage.new(@storage_directory)
  end

  def teardown
    FileUtils.rm_rf(@storage_directory)
  end

  test 'store_blob saves data to file system' do
    id = '123'
    data = 'Hello, World!'
    @storage.store_blob(id, data)

    assert File.exist?(file_path(id))
    assert_equal data, File.read(file_path(id))
  end

  test 'retrieve_blob returns nil if blob does not exist' do
    id = 'non_existent_id'
    assert_nil @storage.retrieve_blob(id)
  end

  test 'retrieve_blob returns data if blob exists' do
    id = '123'
    data = 'Hello, World!'
    File.write(file_path(id), data)

    assert_equal data, @storage.retrieve_blob(id)
  end

  private

  def file_path(id)
    File.join(@storage_directory, "#{id}.bin")
  end
end

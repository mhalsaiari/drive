require 'test_helper'
require_relative '../../../support/fake_storage_service' 
class Api::V1::BlobsControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers 
  def setup
    @blob_data = 'VGhpcyBpcyBhIHRlc3QgZGF0YSBmb3Jt'
  end

  test "should create blob with valid parameters" do
    Api::V1::BlobsController.any_instance.stubs(:authorized).returns(true) # Stub authorized method

    # Generate a unique blob ID for this test case
    blob_id = "blob_#{SecureRandom.hex(4)}"

    post api_v1_blobs_path, params: { id: blob_id, data: @blob_data }
    assert_response :created
  end

  test "should create blob with missing parameters" do
    Api::V1::BlobsController.any_instance.stubs(:authorized).returns(true) # Stub authorized method

    post api_v1_blobs_path
    assert_response :bad_request
  end

  test "should show existing blob" do
    Api::V1::BlobsController.any_instance.stubs(:authorized).returns(true) # Stub authorized method

    # Generate a unique blob ID for this test case
    blob_id = "blob_#{SecureRandom.hex(4)}"

    # Create the blob to ensure it exists
    post api_v1_blobs_path, params: { id: blob_id, data: @blob_data }

    # Show the existing blob
    get api_v1_blob_path(blob_id)
    assert_response :ok
  end

  test "should show non-existing blob" do
    Api::V1::BlobsController.any_instance.stubs(:authorized).returns(true) # Stub authorized method

   
    blob_id = "blob_#{SecureRandom.hex(4)}"

    # Attempt to show a non-existing blob
    get api_v1_blob_path(blob_id)
    assert_response :not_found
  end
end

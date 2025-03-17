require 'net/http'
require 'uri'

class S3Storage
  def initialize(bucket_name)
    @bucket_name = bucket_name
    @base_url = "https://execute-api.us-east-1.amazonaws.com/dev/#{@bucket_name}"
  end

  def store_blob(id, data)
    # Store the blob in the S3-compatible storage
    url = "#{@base_url}/#{id}"
    uri = URI.parse(url)
    request = Net::HTTP::Put.new(uri)
    request.body = data
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end


    return false unless response.code == '200'

    # Save the blob information in the database
    blob = Blob.new(id: id, size: data.size, created_at: Time.now.utc)
    blob.save
  end

  def retrieve_blob(id)
    # Retrieve the blob from the S3-compatible storage
    url = "#{@base_url}/#{id}"
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end


    return nil unless response.code == '200'

    # Return the blob data
    response.body
  end
end

require Rails.root.join('app', 'services', 'local_storage')
require Rails.root.join('app', 'services', 'database_storage')
require Rails.root.join('app', 'services', 's3_storage')

# Load configuration
STORAGE_BACKEND = ENV.fetch('STORAGE_BACKEND', 'database')

# Determine which storage service to use based on the configuration
case STORAGE_BACKEND
when 's3'
  STORAGE_SERVICE = S3Storage.new(ENV['S3_BUCKET'])
when 'database'
  STORAGE_SERVICE = DatabaseStorage.new
else
  server_storage_path = File.expand_path('../../server_storage', __dir__)
  puts server_storage_path
  STORAGE_SERVICE = LocalStorage.new(server_storage_path)
end

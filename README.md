# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- ruby 3.2.2 (2023-03-30 revision e51014f9c0) [arm64-darwin23]
- Rails 7.1.3.2 
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


1- docker-compose up -d  2- rails db:create
2- rails db:migrate
3- rails test
4- Select storage type in file “config/initializers/storage_config.rb”   
    STORAGE_BACKEND = ENV.fetch('STORAGE_BACKEND', 'database')
    - 's3' for S3Bucket
    - 'local' for Local storge    
    - 'database' to store it in the database. 
4- rails s

5- register user  http://127.0.0.1:3000/api/v1/users/register
{
  "user": {
    "email": "user@example.com",
    "password": "password"
  }
}

6- login will return generated token http://127.0.0.1:3000/api/v1/users/login
{
  "email": "user@example.com",
  "password": "password"
}

7 - add the generated token to POST request and send it to store file http://127.0.0.1:3000/api/v1/blobs/
{
"id": "69896ef2-6823-48c8-a24d-bbf69574557",
"data": "SGVsbG8gU2ltcGxlIFN0b3JhZ2UgV29ybGQh"
}

8- to get the file send GET request to http://127.0.0.1:3000/api/v1/blobs/69896ef2-6823-48c8-a24d-bbf69574557
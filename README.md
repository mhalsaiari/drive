# README

Step to run the application:


1- Run docker file to create postgres database container
   ``` 
   docker-compose up -d 
   ```
2- Run create command to create database
```
rails db:create
```
2- Migrate
```
rails db:migrate
```
3- Test
```
rails test
```
4- Select storage type in the initializers 
```
“config/initializers/storage_config.rb”      
 STORAGE_BACKEND = ENV.fetch('STORAGE_BACKEND', 'database')
    - 's3' for S3Bucket
    - 'local' for Local storge    
    - 'database' to store it in the database. 
```
4- Run the application
```
rails s
```
5- Register user  
http://127.0.0.1:3000/api/v1/users/register
```
{
  "user": {
    "email": "user@example.com",
    "password": "password"
  }
}
```
6- login will return generated token http://127.0.0.1:3000/api/v1/users/login
```
{
  "email": "user@example.com",
  "password": "password"
}
```

7 - add the generated token to POST request and send it to store file http://127.0.0.1:3000/api/v1/blobs/
```
{
"id": "69896ef2-6823-48c8-a24d-bbf69574557",
"data": "SGVsbG8gU2ltcGxlIFN0b3JhZ2UgV29ybGQh"
}
```
8- to get the file send GET request to http://127.0.0.1:3000/api/v1/blobs/69896ef2-6823-48c8-a24d-bbf69574557

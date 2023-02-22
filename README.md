# Online Bookshop

## Project details
This is a project for CSC517 course, which is an online bookshop, developed on Rails application.

The application is deployed at http://152.7.177.15:3000/

## Admin Credentials 

There will only be one admin preconfigured and the credentials for the admin are

`username - admin`

`password - 123456`

## User (created via seeding) Credentials 

The password for user created by admin 

`username: user`

`password: 123456`

## Some useful links to operations

### These URLs are accessible only if a user is logged in

#### BOOKS 

|URL|Description|
|---|---|
|http://152.7.177.15:3000/books | View all books |
|![image](https://media.github.ncsu.edu/user/26627/files/f9a6c04d-9faf-4531-ae24-81d313c6ad45)||
|http://152.7.177.15:3000/books/filter?author=Odin&rating=&commit=Filter|Filter books by Author|
|![image](https://media.github.ncsu.edu/user/26627/files/adcdf76a-959f-440c-9191-394980b22dee)||
|http://152.7.177.15:3000/books/filter?author=&rating=3&commit=Filter | Filter books on rating |  
|![image](https://media.github.ncsu.edu/user/26627/files/6a17fe3c-e23b-4453-b0a9-13d5cdd3daa8)||
|http://152.7.177.15:3000/books/filter?author=Odin&rating=3&commit=Filter | Filter books on both Author and Rating|
|![image](https://media.github.ncsu.edu/user/26627/files/a7b50258-4b94-4a70-b9c3-119e2b22e9fc)||
|http://152.7.177.32:3000/transactions/new?book_id=1 | Buy a particular book by clicking this link|
|![image](https://media.github.ncsu.edu/user/26627/files/6643b42a-a3ca-479f-a187-7f418c1c1233)||

#### ADMIN
 
|URL|Description|
|---|---|
|http://152.7.177.15:3000/users | View all users |
|![image](https://media.github.ncsu.edu/user/26627/files/618c3802-2635-4e50-bef5-d5b6ae8a2e61)||
|http://152.7.177.15:3000/reviews/filter?username=user&book_name=&commit=Filter| Reviews written by a specific user |
|![image](https://media.github.ncsu.edu/user/26627/files/8f2ba115-92f1-471f-8a63-26e24a3bfb13)||
|http://152.7.177.15:3000/reviews/filter?username=&book_name=ValkyraeSlayer&commit=Filter| Reviews written for a bookname |
|![image](https://media.github.ncsu.edu/user/26627/files/58b79cd9-8d57-41bb-8fd1-247d22bdce40)||

|![image](https://media.github.ncsu.edu/user/26627/files/31f8917b-429a-403f-8892-414bb4e91859)||



## Testing instructions

To run the tests use the below commands and check if they succeed

To test the models and controllers, run
`rspec`

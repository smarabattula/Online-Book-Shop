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
|http://152.7.177.15:3000/users/| View All Users |
|![image](https://media.github.ncsu.edu/user/26627/files/d7d90706-92f1-4ee3-bdc6-ada6795248df)|
|http://152.7.177.15:3000/users/2/edit| Edit Users |
|![image](https://media.github.ncsu.edu/user/26627/files/798ca4a2-4718-4d4d-8dcf-6991634e9a5d)|
|http://152.7.177.15:3000/users/2/edit| Edit Admin |
|![image](https://media.github.ncsu.edu/user/26627/files/79eb583d-1a01-4cee-8059-5b9b662b8279)|
|http://152.7.177.15:3000/users/| Delete Users |
|![image](https://media.github.ncsu.edu/user/26627/files/c83361e2-9edc-4f62-a720-fa953d5271a2)|
|http://152.7.177.15:3000/books/| Delete Books |
|![image](https://media.github.ncsu.edu/user/26627/files/7d544855-7f9a-4b66-b61a-9bdec0df9e3f)|
|http://152.7.177.15:3000/transactions| View all Transactions |
|![image](https://media.github.ncsu.edu/user/26627/files/c6a5d3d1-deaf-4b46-b406-bc4342fe94f8)|

####REVIEWS (Only admin can edit/delete all reviews, user can only edit his own reviews)
|URL|Description|
|---|---|
|http://152.7.177.15:3000/reviews/new?book_id=2| Create Reviews |
|![image](https://media.github.ncsu.edu/user/26627/files/60648070-a69e-4744-8ced-4a47101685f1)|
|http://152.7.177.15:3000/reviews/1/edit| Edit Reviews (Only admin can edit all reviews, user can only edit his own reviews)|
|![image](https://media.github.ncsu.edu/user/26627/files/60648070-a69e-4744-8ced-4a47101685f1)|
|http://152.7.177.15:3000/reviews/| Delete Reviews |
|![image](https://media.github.ncsu.edu/user/26627/files/660f80c7-91b0-4b26-9b40-543351df2ff6)|
|http://152.7.177.15:3000/reviews/filter?username=user&book_name=&commit=Filter| Reviews written by a specific user |
|![image](https://media.github.ncsu.edu/user/26627/files/8f2ba115-92f1-471f-8a63-26e24a3bfb13)|
|http://152.7.177.15:3000/reviews/filter?username=&book_name=ValkyraeSlayer&commit=Filter| Reviews written for a bookname |
|![image](https://media.github.ncsu.edu/user/26627/files/58b79cd9-8d57-41bb-8fd1-247d22bdce40)|

####USER
|URL|Description|
|---|---|
|http://152.7.177.15:3000/users/2/edit|Edit User|
|![image](https://media.github.ncsu.edu/user/26627/files/4fd0a77e-0a1d-4cb2-981a-401edeb15a16)|
|http://152.7.177.15:3000/| Delete User Account |
|![image](https://media.github.ncsu.edu/user/26627/files/1b720038-1317-4506-8879-25700c99d580)|

## Testing instructions

To run the tests use the below commands and check if they succeed

To test the models and controllers, run
`rspec`

## Edge cases

`Book create:` <br/>
Only Admin has the option to add books. <br/>
A book with no name or blank name, which would fail the validation of presence for Name. <br/>
A book with no author or blank author, which would fail the validation of presence for Author. <br/>
A book with no publisher or blank publisher, which would fail the validation of presence for Publisher. <br/>
A book with a negative price, which would fail the numericality validation of Price. <br/>
A book with a negative stock quantity, which would fail the numericality validation of Stock. 

`Book update:` <br/>
Only admin gets the option to edit book details. 

`Book delete:` <br/> 
Only admin gets the option to delete book details.

`Review create:` <br/>
A User can find add review option only for existing list of Books (in view books). <br/>
A User ratings for books only range from 1 to 5. <br/>
A Review cannot be blank. 

`Review update:` <br/>
A User can edit only his/her reviews. <br/>
Only admin can edit others' reviews.

`Review delete:` <br/>
Only admin can delete others' reviews. <br/>
If user deletes his own account, his reviews also deleted.

`Reviews Filter :` <br/>
When both username and bookname filters are present, the reviews should be filtered with the intersection of both these filters. If no reviews match the intersection of these filters, then a message "No Books Found" should be displayed to the user.

`Empty Username and Password:` <br/>
If the user submits an empty username and password field, the application should return an error message stating that the fields are required

`Invalid username/password:` <br/>
If the user enters an invalid username or password, the application should display an error message indicating that the "username or password is invalid"

`Successful Login:` <br/>
If the user enters a valid username and password, the application should log in the user and redirect them to the root_url with a success message.

`Transaction creation:` <br/>
If the stock of the book is less than the quantity specified by the user, the transaction creation should fail and display an error message that the quantity should be <= available book stock.

`Transaction deletion:` <br/>
If user deletes his own account, their transactions information is also deleted.

`Transaction display:` <br/>
A user can view only their own transactions. Admin can view all the transactions.

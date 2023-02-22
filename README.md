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

## Edge cases

`Filtering reviews:` <br/>
When both username and bookname filters are present, the reviews should be filtered with the intersection of both these filters. If no reviews match the intersection of these filters, then a message "No Books Found" should be displayed to the user.

`Book creation:` <br/>
Only Admin has the option to add books. <br/>
A book with no name or blank name, which would fail the validation of presence for Name. <br/>
A book with no author or blank author, which would fail the validation of presence for Author. <br/>
A book with no publisher or blank publisher, which would fail the validation of presence for Publisher. <br/>
A book with a negative price, which would fail the numericality validation of Price. <br/>
A book with a negative stock quantity, which would fail the numericality validation of Stock. 

`Book updation:` <br/>
Only admin gets the option to edit book details. 

`Review creation:` <br/>
A User can find add review option only for existing list of Books (in view books). <br/>
A User ratings for books only range from 1 to 5. <br/>
A Review cannot be blank. 

`Review updation:` <br/>
A User can edit only his/her reviews. <br/>
Only admin can edit others' reviews.

`Review deletion:` <br/>
Only admin can delete others' reviews. <br/>
If user deletes his own account, his reviews also deleted.

`Empty Username and Password:` <br/>
If the user submits an empty username and password field, the application should return an error message stating that the fields are required

`Invalid username/password:` <br/>
If the user enters an invalid username or password, the application should display an error message indicating that the "username or password is invalid"

`Successful Login:` <br/>
If the user enters a valid username and password, the application should log in the user and redirect them to the root_url with a success message.

`Transaction creation:` <br/>
If the stock of the book is less than the quantity specified by the user, the transaction creation should fail and display an error message that the quantity should be <= available book stock.

`Transaction deletion:` <br/>
Only admin has the option of deleting transactions. <br/>
If user deletes his own account, his transactions information is also deleted.

`Transaction display:` <br/>
A user can view only his/her own transactions. Admin can view all the transactions.

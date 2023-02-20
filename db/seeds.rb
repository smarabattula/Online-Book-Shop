require 'bcrypt'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
password = '1234'
encrypted_password = BCrypt::Password.create(password)
User.create(username: 'admin', password: encrypted_password, name: 'admin', email: 'admin@book.com',credit_card_number:'9876543210987654', phone_number:'9876543210',address:'admin address', is_admin: true)
User.create(username: 'user', password: encrypted_password, name: 'sample user', email: 'user1@book.com', credit_card_number:'1234567890123456', phone_number:'1234567890',address:'user address', is_admin: false)
Book.create(Name:'ValkyraeSlayer', Author:'Odin', Publisher:'Asgard Inc', Price:10,Stock:1000 )
Book.create(Name:'The Shelbys', Author:'Thomas Shelby', Publisher:'Shelby Inc', Price:5,Stock:5000 )
Book.create(Name:'God of War', Author:'Kratos', Publisher:'Santa Monica Studios', Price:50,Stock:5000 )


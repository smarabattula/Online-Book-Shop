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
User.create(username: 'admin', password_digest: encrypted_password, name: 'admin', email: 'admin@book.com', is_admin: true)


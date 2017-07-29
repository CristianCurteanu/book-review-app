# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

user = User.create first_name: 'John',
                   last_name: 'Smith',
                   email: 'john.smith@google.com',
                   password: 'password'

book = Book.create title: 'Sherlock Holmes',
                   author: 'Arthur Conan Doyle',
                   description: 'A collection of adventures of a legendary detective, Sherlock Holmes'

book.reviews.create rating: 4, comment: 'Amazing Book'

user.reviews = book.reviews
user.save!
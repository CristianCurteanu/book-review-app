# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require "faker"

if Rails.env.development?
  12.times do
    User.create first_name: Faker::Name.first_name,
                last_name:  Faker::Name.last_name,
                email:      Faker::Internet.email,
                password:   'test'
  end

  books = [
    {
      title: 'The Silmarillion',
      author: 'J. R. R. Tolkien',
      description: 'The Silmarillion is a collection of mythopoeic works by English writer J. R. R. Tolkien, edited and published posthumously by his son, Christopher Tolkien, in 1977, with assistance from Guy Gavriel Kay. The Silmarillion, along with J. R. R.',
      cover_url: '/uploads/silmarillion.png'
    },

    {
      title: 'American Gods',
      author: 'Neil Gaiman',
      description: 'American Gods is a novel by English author Neil Gaiman. The novel is a blend of Americana, fantasy, and various strands of ancient and modern mythology, all centering on the mysterious and taciturn Shadow.',
      cover_url: '/uploads/american_gods.jpeg'
    },

    {
      title: 'The Dark Tower II: The Drawing of the Three',
      author: 'Stephen King',
      description: 'The Drawing of the Three is a fantasy novel by American writer Stephen King, the second book in The Dark Tower series, published by Grant in 1987. The series was inspired by Childe Roland to the Dark Tower Came by Robert Browning.',
      cover_url: '/uploads/the_dark_tower.jpeg'
    },

    {
      title: 'Under the Dome',
      author: 'Stephen King',
      description: 'Under the Dome is a science fiction novel by Stephen King published in November 2009. Set in and around a small Maine town, it tells an intricate, multi-character and point-of-view story of how the town\'s inhabitants contend with the calamity of being suddenly cut off from the outside world by an impassable, invisible barrier that drops out of the sky.',
      cover_url: '/uploads/under_the_dome.jpg'
    },

    {
      title: 'The Name of the Wind',
      author: 'Patrick Rothfuss',
      description: 'The Name of the Wind is a fantasy novel by Patrick Rothfuss, the first book in a series called The Kingkiller Chronicle. It was published in 2007 by DAW Books.',
      cover_url: '/uploads/the_name_of_the_wind.jpg'
    }
  ]

  books.each do |book|
    new_book = Book.create book.except(:cover_url)
    new_book.create_photo url: book[:cover_url]
    User.all.each do |user|
      review = Review.create rating: rand(1..5),
                             comment: [Faker::Lorem.sentence,
                                        Faker::Lorem.paragraph].sample

      new_book.reviews << review
      user.reviews << review
    end
  end
else
  25.times do
    User.create first_name: Faker::Name.first_name,
                last_name:  Faker::Name.last_name,
                email:      Faker::Internet.email,
                password:   'test'
  end

  500.times do
    book = Book.create title:       Faker::Book.title,
                       author:      Faker::Book.author,
                       description: Faker::Lorem.paragraph
    book.create_photo url: '/assets/some_photo'
  end
end

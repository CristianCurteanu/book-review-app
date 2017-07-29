require 'rails_helper'

describe Photo, type: :model do
  it 'should have url' do
    expect(described_class.new(book_id: 4)).not_to be_valid
  end

  it 'should be valid with valid url and book ID' do
    book = Book.new title: Faker::Book.title,
                               author: Faker::Book.author,
                               description: Faker::Lorem.sentence
    photo = described_class.new url: 'http://site.com/image.jpg', book_id: 2
    expect(photo).to be_valid
  end
end

require 'rails_helper'

describe Book, type: :model do
  it 'should have many reviews' do
    should have_many(:reviews)
  end

  it 'should have one photo' do
    should have_one(:photo)
  end

  it 'should not be valid w/o any attributes' do
    expect(described_class.new).not_to be_valid
  end

  it 'should be valid only if title, author and description is specified' do
    book = described_class.new title: Faker::Book.title,
                               author: Faker::Book.author,
                               description: Faker::Lorem.sentence
    expect(book).to be_valid
  end

  it 'should have title' do
    expect(subject.attributes).to include('title')
  end

  it 'should have author' do
    expect(subject.attributes).to include('author')
  end

  it 'should have description' do
    expect(subject.attributes).to include('description')
  end
end

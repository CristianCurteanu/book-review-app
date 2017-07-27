class Book < ApplicationRecord
  has_one :photo
  has_many :reviews

  validates_presence_of :author, :description, :title
end

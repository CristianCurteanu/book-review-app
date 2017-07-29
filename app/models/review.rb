class Review < ApplicationRecord
  validates_presence_of :comment, :rating
end

class User < ApplicationRecord
  has_secure_password

  has_many :reviews

  validates_presence_of :email, :password, :first_name, :last_name

  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def full_name
    [self.first_name, self.last_name].join(' ')
  end
end

class User < ApplicationRecord
  has_many :projects
  validates :name, length: {minimum: 1}
  has_secure_password
end

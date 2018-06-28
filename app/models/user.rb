class User < ApplicationRecord
  has_many :projects
  has_many :notes, through: :projects
  validates :name, length: {minimum: 1}
  has_secure_password
end

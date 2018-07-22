class Project < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :title, presence: true

  scope :latest, ->(column = :created_at) {order(column => :desc)}

  def user_name
    self.user.name
  end

  def user_name=(name)
    self.user = User.find_or_create_by(name: name)
  end
end

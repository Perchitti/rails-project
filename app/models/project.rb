class Project < ApplicationRecord
  belongs_to :user

  def user_name
    self.user.name
  end

  def user_name=(name)
    self.user = User.find_or_create_by(name: name)
  end
end
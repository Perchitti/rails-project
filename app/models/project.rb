class Project < ApplicationRecord
  belongs_to :user

  def user_name
    self.try(:user).try(:name)
  end

  def user_name=(name)
    user = User.find_or_create_by(name: name)
    self.user = user
  end
end

class AddLocationToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :location, foreign_key: true
  end
end

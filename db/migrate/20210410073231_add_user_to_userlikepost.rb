class AddUserToUserlikepost < ActiveRecord::Migration[5.2]
  def change
    add_reference :userlikeposts, :user, foreign_key: true
  end
end

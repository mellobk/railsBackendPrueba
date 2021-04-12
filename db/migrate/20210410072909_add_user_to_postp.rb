class AddUserToPostp < ActiveRecord::Migration[5.2]
  def change
    add_reference :postps, :user, foreign_key: true
  end
end

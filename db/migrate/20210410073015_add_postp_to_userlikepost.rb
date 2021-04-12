class AddPostpToUserlikepost < ActiveRecord::Migration[5.2]
  def change
    add_reference :userlikeposts, :postp, foreign_key: true
  end
end

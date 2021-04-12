class AddPostpToComentario < ActiveRecord::Migration[5.2]
  def change
    add_reference :comentarios, :postp, foreign_key: true
  end
end

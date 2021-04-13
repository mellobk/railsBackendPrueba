class CreatePostps < ActiveRecord::Migration[5.2]
  def change
    create_table :postps do |t|
      t.string :nombre
      t.string :contenido
      t.integer :numero_likes
      t.integer :numero_lislikes
      t.integer :numero_comentarios

      t.timestamps
    end
  end
end

class CreatePostps < ActiveRecord::Migration[5.2]
  def change
    create_table :postps do |t|
      t.string :nombre
      t.string :contenido
      t.integer :numerolikes
      t.integer :numerolislikes
      t.integer :numerocomentarios

      t.timestamps
    end
  end
end

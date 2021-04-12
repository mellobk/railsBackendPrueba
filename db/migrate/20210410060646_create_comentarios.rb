class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :nombre
      t.string :contenido

      t.timestamps
    end
  end
end

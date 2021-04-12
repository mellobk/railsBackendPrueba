class CreateUserlikeposts < ActiveRecord::Migration[5.2]
  def change
    create_table :userlikeposts do |t|
      t.integer :status

      t.timestamps
    end
  end
end

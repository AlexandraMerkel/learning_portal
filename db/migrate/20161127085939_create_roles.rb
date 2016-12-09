class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :role_name, null: false
      t.string :full_name, null: false
      t.string :role_name_eng, null: false

      t.index :role_name, unique: true
      t.index :full_name, unique: true
      t.index :role_name_eng, unique: true

      t.timestamps null: false
    end
  end
end

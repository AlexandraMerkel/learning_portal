class CreateRoleUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :role_users do |t|
      t.json :info
      t.references :user, foreign_key: true, null: false
      t.references :role, foreign_key: true, null: false

      t.index [:user_id, :role_id], unique: true

      t.timestamps null: false
    end
  end
end

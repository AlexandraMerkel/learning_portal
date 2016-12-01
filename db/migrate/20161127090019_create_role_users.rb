class CreateRoleUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :role_users do |t|
      t.json :info
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMessageUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :message_users do |t|
      t.integer :viewing, null: false
      t.references :message, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.index [:user_id, :message_id], unique: true

      t.timestamps null: false
    end
  end
end

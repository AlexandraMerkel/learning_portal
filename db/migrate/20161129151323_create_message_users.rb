class CreateMessageUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :message_users do |t|
      t.integer :viewing
      t.references :message, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

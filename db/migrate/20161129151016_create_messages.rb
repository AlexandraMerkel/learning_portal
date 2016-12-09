class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :message_content, null: false
      t.datetime :send_time, null: false
      t.attachment :message
      t.references :message_list, index: true, foreign_key: true, null: false
      t.references :sender, index: true, foreign_key: {to_table: :users}, null: false

      t.timestamps null: false
    end
  end
end

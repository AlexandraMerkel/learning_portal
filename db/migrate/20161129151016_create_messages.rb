class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :message_content
      t.datetime :send
      t.attachment :message
      t.references :message_list, foreign_key: true
      t.references :sender, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

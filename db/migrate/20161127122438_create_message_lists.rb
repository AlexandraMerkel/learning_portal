class CreateMessageLists < ActiveRecord::Migration[5.0]
  def change
    create_table :message_lists do |t|
      t.string :header

      t.timestamps null: false
    end
  end
end

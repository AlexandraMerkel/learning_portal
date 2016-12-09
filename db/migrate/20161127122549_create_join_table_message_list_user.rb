class CreateJoinTableMessageListUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :message_lists, :users do |t|
       t.index [:message_list_id, :user_id], unique: true
      # t.index [:user_id, :message_list_id]
    end
  end
end

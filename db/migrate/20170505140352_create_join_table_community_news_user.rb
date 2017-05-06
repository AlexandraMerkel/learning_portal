class CreateJoinTableCommunityNewsUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :community_newses, :users do |t|
      t.index [:community_news_id, :user_id], unique: true
      # t.index [:user_id, :community_news_id]
    end
  end
end

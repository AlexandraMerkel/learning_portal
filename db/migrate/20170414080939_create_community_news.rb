class CreateCommunityNews < ActiveRecord::Migration[5.0]
  def change
    create_table :community_news do |t|
      t.text :news_body
      t.references :user, foreign_key: true
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end

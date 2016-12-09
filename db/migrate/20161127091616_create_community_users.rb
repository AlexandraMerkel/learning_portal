class CreateCommunityUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :community_users do |t|
      t.integer :link_type, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :community, index: true, foreign_key: true, null: false

      t.index [:user_id, :community_id], unique: true

      t.timestamps null: false
    end
  end
end

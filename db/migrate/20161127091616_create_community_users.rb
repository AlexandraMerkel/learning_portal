class CreateCommunityUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :community_users do |t|
      t.integer :link_type
      t.references :user, foreign_key: true
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end

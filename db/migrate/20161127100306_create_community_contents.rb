class CreateCommunityContents < ActiveRecord::Migration[5.0]
  def change
    create_table :community_contents do |t|
      t.integer :view_type
      t.text :content_body
      t.integer :content_visibility
      t.datetime :show
      t.references :community_tab, foreign_key: true
      t.references :creator, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

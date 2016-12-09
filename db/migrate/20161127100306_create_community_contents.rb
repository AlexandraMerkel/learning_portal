class CreateCommunityContents < ActiveRecord::Migration[5.0]
  def change
    create_table :community_contents do |t|
      t.integer :view_type, null: false
      t.text :content_body, null: false
      t.integer :content_visibility, null: false
      t.datetime :show
      t.references :community_tab, index: true, foreign_key: true, null: false
      t.references :creator, index: true, foreign_key: {to_table: :users}, null: false

      t.timestamps null: false
    end
  end
end

class CreateCommunityTabs < ActiveRecord::Migration[5.0]
  def change
    create_table :community_tabs do |t|
      t.references :community_section, index: true, foreign_key: true, null: false
      t.string :tab_name, null: false
      t.integer :tab_position, null: false

      t.index [:tab_name, :community_section_id], unique: true

      t.timestamps null: false
    end
  end
end

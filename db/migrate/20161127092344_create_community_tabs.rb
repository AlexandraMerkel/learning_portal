class CreateCommunityTabs < ActiveRecord::Migration[5.0]
  def change
    create_table :community_tabs do |t|
      t.references :community_section, foreign_key: true
      t.string :tab_name
      t.integer :tab_position

      t.timestamps
    end
  end
end

class CreateCommunitySections < ActiveRecord::Migration[5.0]
  def change
    create_table :community_sections do |t|
      t.string :section_name
      t.integer :section_type
      t.integer :section_position
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end

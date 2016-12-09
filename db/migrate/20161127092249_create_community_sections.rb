class CreateCommunitySections < ActiveRecord::Migration[5.0]
  def change
    create_table :community_sections do |t|
      t.string :section_name, null: false
      t.integer :section_type, null: false
      t.integer :section_position, null: false
      t.references :community, index: true, foreign_key: true, null: false

      t.index [:section_name, :community_id], unique: true
      t.index [:section_type, :community_id], unique: true

      t.timestamps null: false
    end
  end
end

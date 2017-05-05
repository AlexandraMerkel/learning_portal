class CreateDisciplineSections < ActiveRecord::Migration[5.0]
  def change
    create_table :discipline_sections do |t|
      t.integer :discipline_type, null: false
      t.string :section_name, null: false
      t.integer :section_type, null: false
      t.integer :weight, null: false
      t.integer :min_score, null: false
      t.integer :max_score, null: false
      t.integer :require_type, null: false
      t.float :attenuation_constant, null: false
      t.date :optimal_time, null: false
      t.date :limit_time, null: false
      t.references :discipline, index: true, foreign_key: true, null: false
      t.references :community,  index: true, foreign_key: true, null: false

      t.index [:section_name, :discipline_id, :community_id], unique: true, name: "discipline_section_in_community"

      t.timestamps null: false
    end
  end
end

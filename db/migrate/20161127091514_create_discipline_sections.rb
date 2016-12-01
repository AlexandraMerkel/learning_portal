class CreateDisciplineSections < ActiveRecord::Migration[5.0]
  def change
    create_table :discipline_sections do |t|
      t.string :section_name
      t.integer :section_type
      t.integer :weight
      t.integer :min_score
      t.integer :max_score
      t.integer :require_type
      t.float :attenuation_constant
      t.date :optimal_time
      t.date :limit_time
      t.references :discipline, foreign_key: true

      t.timestamps
    end
  end
end

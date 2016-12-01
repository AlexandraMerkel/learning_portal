class CreateDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplines do |t|
      t.string :discipline_name
      t.integer :discipline_type
      t.integer :discipline_end
      t.references :term, foreign_key: true
      t.references :ranking_algorithm, foreign_key: true

      t.timestamps
    end
  end
end

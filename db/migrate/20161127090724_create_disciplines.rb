class CreateDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplines do |t|
      t.string :discipline_name, null: false
      t.integer :discipline_type, array: true, default: [], null: false # возможно несколько типов
      t.integer :discipline_end, null: false
      t.references :term, index: true, foreign_key: true, null: false
      t.references :ranking_algorithm, index: true, foreign_key: true, null: false

      t.index [:discipline_name, :discipline_type, :discipline_end], unique: true, name: "discipline_name_type_end"

      t.timestamps null: false
    end
  end
end

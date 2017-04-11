class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.integer :mark_value, null: false
      t.date :report, null: false
      t.references :discipline_section, index: true, foreign_key: true, null: false
      t.references :student, index: true, foreign_key: {to_table: :users}, null: false
      t.references :teacher, index: true, foreign_key: {to_table: :users}, null: false

      t.timestamps null: false
    end
  end
end
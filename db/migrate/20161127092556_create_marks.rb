class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.integer :mark_value
      t.date :report
      t.references :discipline_section, foreign_key: true
      t.references :student, foreign_key: {to_table: :users}
      t.references :teacher, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

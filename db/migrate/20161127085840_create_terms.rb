class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :term_name, null: false
      t.boolean :actual, default: false
      t.date :term_start, null: false
      t.date :term_end, null: false

      t.index :term_name, unique: true
      t.index :term_start, unique: true
      t.index :term_end, unique: true

      t.timestamps null: false
    end
  end
end

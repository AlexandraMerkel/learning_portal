class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :term_name
      t.boolean :actual
      t.date :term_start
      t.date :term_end

      t.timestamps
    end
  end
end

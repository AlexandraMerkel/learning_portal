class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :group_name, null: false
      t.date :group_start, null: false
      t.date :archive_time, null: false
      t.references :term, index: true, foreign_key: true, null: false

      t.index :group_name, unique: true

      t.timestamps null: false
    end
  end
end

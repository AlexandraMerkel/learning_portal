class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.date :group_start
      t.date :archive_time
      t.references :term, foreign_key: true

      t.timestamps
    end
  end
end

class CreateStudyFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :study_files do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.attachment :study, null: false

      t.timestamps null: false
    end
  end
end

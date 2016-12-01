class CreateStudyFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :study_files do |t|
      t.references :user, foreign_key: true
      t.attachment :study

      t.timestamps
    end
  end
end

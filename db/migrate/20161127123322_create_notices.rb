class CreateNotices < ActiveRecord::Migration[5.0] 
  def change
    create_table :notices do |t|
      t.integer :notice_type, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :community_section, index: true, foreign_key: true, null: false

      t.index [:user_id, :community_section_id], unique: true

      t.timestamps null: false
    end
  end
end

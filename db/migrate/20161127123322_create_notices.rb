class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|
      t.integer :notice_type
      t.references :user, foreign_key: true
      t.references :community_section, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCommunityDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :community_disciplines do |t|
      t.references :discipline, index: true, foreign_key: true, null: false
      t.references :community, index: true, foreign_key: true, null: false

      t.index [:discipline_id, :community_id], unique: true

      t.timestamps null: false
    end
  end
end

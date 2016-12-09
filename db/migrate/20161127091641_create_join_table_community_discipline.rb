class CreateJoinTableCommunityDiscipline < ActiveRecord::Migration[5.0]
  def change
    create_join_table :communities, :disciplines do |t|
       t.index [:community_id, :discipline_id], unique: true
      # t.index [:discipline_id, :community_id]
    end
  end
end

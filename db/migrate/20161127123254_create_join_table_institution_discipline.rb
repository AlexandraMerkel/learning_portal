class CreateJoinTableInstitutionDiscipline < ActiveRecord::Migration[5.0]
  def change
    create_join_table :institutions, :disciplines do |t|
       t.index [:institution_id, :discipline_id], unique: true, name: "institution_discipline"
      # t.index [:discipline_id, :institution_id]
    end
  end
end

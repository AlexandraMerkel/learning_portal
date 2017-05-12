class CreateInstitutionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_users do |t|
      t.string :rank
      t.references :user,  index: true, foreign_key: true,  null: false
      t.references :institution,  index: true, foreign_key: true, null: false

      t.index [:user_id, :institution_id], unique: true

      t.timestamps null: false
    end
  end
end

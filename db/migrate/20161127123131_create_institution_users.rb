class CreateInstitutionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_users do |t|
      t.string :rank
      t.references :user, foreign_key: true
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end

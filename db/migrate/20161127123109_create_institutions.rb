class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :institution_name, null: false
      t.string :short_institution_name, null: false
      t.string :address, null: false
      t.string :phone_number, null: false

      t.index :institution_name, unique: true
      t.index :short_institution_name, unique: true

      t.timestamps null: false
    end
  end
end

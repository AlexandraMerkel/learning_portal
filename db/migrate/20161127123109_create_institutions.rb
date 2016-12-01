class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :institution_name
      t.string :short_instituton_name
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end

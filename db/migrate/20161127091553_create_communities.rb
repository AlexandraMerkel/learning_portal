class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.string :community_name, null: false
      t.integer :community_visibility, null: false
      t.integer :archive, null: false

      t.index :community_name, unique: true

      t.timestamps null: false
    end
  end
end

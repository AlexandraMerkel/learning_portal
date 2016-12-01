class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.string :community_name
      t.integer :community_visibility
      t.integer :archive

      t.timestamps
    end
  end
end

class CreateRankingAlgorithms < ActiveRecord::Migration[5.0]
  def change
    create_table :ranking_algorithms do |t|
      t.string :algorithm_name, null: false
      t.text :template, null: false

      t.index :algorithm_name, unique: true

      t.timestamps null: false
    end
  end
end

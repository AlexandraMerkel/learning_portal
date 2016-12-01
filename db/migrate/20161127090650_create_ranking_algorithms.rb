class CreateRankingAlgorithms < ActiveRecord::Migration[5.0]
  def change
    create_table :ranking_algorithms do |t|
      t.string :algorithm_name
      t.text :template

      t.timestamps
    end
  end
end

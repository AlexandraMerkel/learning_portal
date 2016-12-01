class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :user_description, :text
    add_column :users, :sex, :string
  end
end

class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :addres, :string
    add_column :users, :bio, :string
    add_column :users, :photo, :string
  end
end

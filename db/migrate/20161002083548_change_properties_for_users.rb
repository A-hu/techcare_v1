class ChangePropertiesForUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :first_name, :string, null: true
  	change_column :users, :last_name, :string, null: true
  	change_column :users, :cell_phone_number, :string, null: true
  end
end

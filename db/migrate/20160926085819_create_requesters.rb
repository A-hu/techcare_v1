class CreateRequesters < ActiveRecord::Migration[5.0]
  def change
    create_table :requesters do |t|
    	t.integer :user_id, null: false
    	t.string :address
    	t.text :condition_description

      t.timestamps
    end
    add_index :requesters, :user_id, unique: true
  end
end

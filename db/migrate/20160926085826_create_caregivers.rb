class CreateCaregivers < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers do |t|
    	t.integer :user_id, null: false
    	t.text :introduction
    	t.text :experience
    	t.text :skill
    	t.string :licence_number
    	t.date :licence_offdate
    	t.string :training

      t.timestamps
    end
    add_index :caregivers, :user_id, unique: true
  end
end

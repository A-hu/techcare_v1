class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medications do |t|
    	t.integer :requester_id
    	t.text 		:description

      t.timestamps
    end
    add_index :medications, :requester_id
  end
end

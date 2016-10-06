class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.integer :caregiver_id
    	t.integer :requester_id
    	t.string :status

      t.timestamps
    end
    add_index :orders, :caregiver_id
    add_index :orders, :requester_id
  end
end

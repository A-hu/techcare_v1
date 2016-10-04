class CreateHealthRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :health_records do |t|
    	t.integer :requester_id
    	t.integer :systolic_record
    	t.integer :diastolic_record
    	t.integer :heart_rate
    	t.integer :blood_sugar

      t.timestamps
    end
    add_index :health_records, :requester_id
  end
end

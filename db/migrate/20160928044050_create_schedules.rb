class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
    	t.integer :caregiver_id, null: false
    	t.date :scheduled_date, null:false, unique: true

      t.timestamps
    end
    add_index :schedules, :caregiver_id
  end
end

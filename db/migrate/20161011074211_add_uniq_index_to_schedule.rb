class AddUniqIndexToSchedule < ActiveRecord::Migration[5.0]
  def change
  	add_index :schedules, [:scheduled_date, :requester_id], unique: true
  end
end

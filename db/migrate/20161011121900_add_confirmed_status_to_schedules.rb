class AddConfirmedStatusToSchedules < ActiveRecord::Migration[5.0]
  def change
  	add_column :schedules, :caregiver_confirmed, :boolean
  	add_column :schedules, :requester_confirmed, :boolean
  end
end

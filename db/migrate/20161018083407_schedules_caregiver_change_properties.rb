class SchedulesCaregiverChangeProperties < ActiveRecord::Migration[5.0]
  def change
  	change_column :schedules, :caregiver_id, :integer, null: true
  end
end

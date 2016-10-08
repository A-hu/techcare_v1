class AddConfirmToEvent < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :caregiver_confirm, :boolean, default: false
  	add_column :events, :requester_confirm, :boolean, default: false
  end
end

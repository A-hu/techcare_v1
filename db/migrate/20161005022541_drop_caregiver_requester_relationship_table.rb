class DropCaregiverRequesterRelationshipTable < ActiveRecord::Migration[5.0]
  def change
  	# drop_table :caregiver_requester_relationships
  	add_column :health_records, :caregiver_id, :integer
  end
end

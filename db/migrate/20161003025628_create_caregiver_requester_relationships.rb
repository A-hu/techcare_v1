class CreateCaregiverRequesterRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :caregiver_requester_relationships do |t|
    	t.integer :caregiver_id
    	t.integer :requester_id
    	t.integer :status, default: 0

      t.timestamps
    end
    add_index :caregiver_requester_relationships, :caregiver_id
    add_index :caregiver_requester_relationships, :requester_id
  end
end

class RemoveRequesteridToScheule < ActiveRecord::Migration[5.0]
  def change
  	add_column :schedules, :requester_id, :integer
  	add_index  :schedules, :requester_id
  end
end

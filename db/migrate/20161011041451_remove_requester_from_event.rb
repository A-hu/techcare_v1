class RemoveRequesterFromEvent < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :requester_id
  end
end

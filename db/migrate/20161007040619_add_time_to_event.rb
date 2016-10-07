class AddTimeToEvent < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :time_zone_id, :integer
  	add_index :events, :time_zone_id
  end
end

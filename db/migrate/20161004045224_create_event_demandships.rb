class CreateEventDemandships < ActiveRecord::Migration[5.0]
  def change
    create_table :event_demandships do |t|
    	t.integer :event_id
    	t.integer :demand_id

      t.timestamps
    end
    add_index :event_demandships, :event_id
    add_index :event_demandships, :demand_id
  end
end

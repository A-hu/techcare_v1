class CreateTimeEventships < ActiveRecord::Migration[5.0]
  def change
    create_table :time_eventships do |t|
    	t.integer :time_zone_id
    	t.integer :event_id
    	t.string :service, default: "off"

      t.timestamps
    end
    add_index :time_eventships, :time_zone_id
    add_index :time_eventships, :event_id
  end
end

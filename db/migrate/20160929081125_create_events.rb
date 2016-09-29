class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.integer :schedule_id, null: false
    	t.integer :requester_id, null: false
    	t.string :event_name
    	t.string :time_zone
    	t.boolean :push, default: false
      t.timestamps
    end

    add_index :events, :schedule_id
    add_index :events, :requester_id
  end
end

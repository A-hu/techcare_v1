class CreateTimeZones < ActiveRecord::Migration[5.0]
  def change
    create_table :time_zones do |t|
    	t.string :zone

      t.timestamps
    end
    remove_column :events, :time_zone
  end
end

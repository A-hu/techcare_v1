class AddDateToHealthrecord < ActiveRecord::Migration[5.0]
  def change
  	add_column :health_records, :record_day, :date
  end
end

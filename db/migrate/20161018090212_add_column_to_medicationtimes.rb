class AddColumnToMedicationtimes < ActiveRecord::Migration[5.0]
  def change
  	add_column :medication_times, :take_time, :string
  end
end

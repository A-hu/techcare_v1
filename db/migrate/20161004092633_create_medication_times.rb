class CreateMedicationTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :medication_times do |t|
    	t.string :name

      t.timestamps
    end
    add_column :medications, :time_id, :integer
  end
end

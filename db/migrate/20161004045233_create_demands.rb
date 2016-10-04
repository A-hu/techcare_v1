class CreateDemands < ActiveRecord::Migration[5.0]
  def change
    create_table :demands do |t|
    	t.integer :demand_category_id
    	t.string :demand_name

      t.timestamps
    end
    add_index :demands, :demand_category_id
  end
end

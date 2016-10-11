class AddCompleteToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :complete_time, :string
  end
end

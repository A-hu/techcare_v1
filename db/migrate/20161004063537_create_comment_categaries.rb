class CreateCommentCategaries < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_categaries do |t|
    	t.string :name

      t.timestamps
    end
  add_column :comments, :comment_category_id, :integer
  add_index  :comments, :comment_category_id
  end
end

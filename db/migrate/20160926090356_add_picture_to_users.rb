class AddPictureToUsers < ActiveRecord::Migration[5.0]

  def up
    add_attachment :users, :picture
  end

  def down
    remove_attachment :users, :picture
  end

end

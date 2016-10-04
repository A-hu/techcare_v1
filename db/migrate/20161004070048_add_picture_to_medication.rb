class AddPictureToMedication < ActiveRecord::Migration[5.0]
  
  def up
    add_attachment :medications, :picture
  end

  def down
    remove_attachment :medications, :picture
  end

end

class AddZoomLinkToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :zoom_link, :string
  end
end

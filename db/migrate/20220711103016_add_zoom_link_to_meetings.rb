class AddZoomLinkToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :zoom_link, :string
  end
end

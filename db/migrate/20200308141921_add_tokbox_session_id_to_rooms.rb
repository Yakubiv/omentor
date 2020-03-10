class AddTokboxSessionIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :class_rooms, :tokbox_session_id, :string
    add_column :class_rooms, :tokbox_token, :string
    add_column :class_rooms, :active_call, :boolean, default: false
  end
end

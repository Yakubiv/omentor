class AddUuidToClassRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :class_rooms, :uuid, :string, index: true, unique: true
  end
end

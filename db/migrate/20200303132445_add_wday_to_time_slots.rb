class AddWdayToTimeSlots < ActiveRecord::Migration[6.0]
  def change
    add_column :time_slots, :wday, :string, index: true
  end
end

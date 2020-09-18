class RemoveDefaultTimeZone < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:profiles, :time_zone, nil)
  end
end

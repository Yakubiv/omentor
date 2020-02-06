class CreateTimeSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :time_slots do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :profile, index: true

      t.timestamps
    end
  end
end

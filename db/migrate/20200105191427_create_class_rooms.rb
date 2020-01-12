class CreateClassRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :class_rooms do |t|
      t.references :student_profile, index: true
      t.references :tutor_profile, index: true
      t.integer :status, default: 0
      t.string :name

      t.timestamps
    end
  end
end

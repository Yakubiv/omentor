class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :status, default: 0
      t.datetime :start_at
      t.decimal :duration, precision: 8, scale: 2
      t.references :subject, index: true
      t.references :class_room, index: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
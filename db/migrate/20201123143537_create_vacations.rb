class CreateVacations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacations do |t|
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.integer :status
      t.references :profile, index: true

      t.timestamps
    end
  end
end

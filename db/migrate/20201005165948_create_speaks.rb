class CreateSpeaks < ActiveRecord::Migration[6.0]
  def change
    create_table :speaks do |t|
      t.integer :level
      t.references :profile, index: true
      t.references :language, index: true

      t.timestamps
    end
  end
end

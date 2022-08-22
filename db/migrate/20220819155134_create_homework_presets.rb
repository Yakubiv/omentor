class CreateHomeworkPresets < ActiveRecord::Migration[7.0]
  def change
    create_table :homework_presets do |t|
      t.text :description
      t.boolean :active, default: true
      t.text :subject_theme
      t.references :subject, index: true
      t.references :profile, index: true

      t.timestamps
    end
  end
end

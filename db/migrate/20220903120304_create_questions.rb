class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.boolean :active
      t.integer :kind
      t.references :homework_preset, index: true
      t.references :tutor_profile, index: true

      t.timestamps
    end
  end
end

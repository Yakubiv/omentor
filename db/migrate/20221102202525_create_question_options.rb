class CreateQuestionOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :question_options do |t|
      t.references :question, null: false, foreign_key: true
      t.string :title
      t.boolean :is_correct
      t.text :correct_text

      t.timestamps
    end
  end
end

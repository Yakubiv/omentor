class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.text :describe
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end

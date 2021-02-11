class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :stars
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end

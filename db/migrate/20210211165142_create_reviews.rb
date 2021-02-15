class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :stars
      t.bigint :reviewer_id
      t.references :reviewable, polymorphic: true
      t.timestamps
    end
  end
end

class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :profile, index: true
      t.references :favoritable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :class_room, index: true
      t.references :profile, index: true
      t.boolean :read, default: false

      t.timestamps
    end
  end
end

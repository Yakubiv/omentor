class AddUuidToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :uuid, :string, index: true, unique: true
  end
end

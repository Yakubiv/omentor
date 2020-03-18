class AddCitextToSubjects < ActiveRecord::Migration[6.0]
  def change
    enable_extension("citext")

    change_column :subjects, :name, :citext
    add_index :subjects, :name, unique: true
  end
end

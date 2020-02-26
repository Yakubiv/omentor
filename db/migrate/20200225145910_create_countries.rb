class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :code
      t.string :locale

      t.timestamps
    end
  end
end
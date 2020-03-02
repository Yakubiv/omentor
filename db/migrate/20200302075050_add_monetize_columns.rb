class AddMonetizeColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :rate
    remove_column :lessons, :price

    add_monetize :profiles, :rate
    add_monetize :lessons, :price
  end
end

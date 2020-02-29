class ChangeDecimalScale < ActiveRecord::Migration[6.0]
  def up
    change_column :profiles, :rate, :integer
    change_column :profiles, :total_years_of_expirience, :integer
    change_column :profiles, :stars, :decimal, precision: 3, scale: 1
  end

  def down
    change_column :profiles, :rate, :integer
    change_column :profiles, :total_years_of_expirience, :integer
    change_column :profiles, :stars, :decimal, precision: 3, scale: 1
  end
end

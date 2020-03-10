class RenameCountryColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :profiles, :country, :country_name
  end
end

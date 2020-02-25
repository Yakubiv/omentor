class AddCountryIdToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :country_id, :integer, index: true
  end
end

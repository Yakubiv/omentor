class AddShortDescriptionToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :short_bio, :text
  end
end

class AddVideoUrlToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :video_url, :string
  end
end

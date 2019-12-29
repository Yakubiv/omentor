class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.datetime :birthday
      t.string :phone
      t.string :dial_code
      t.string :city
      t.string :country
      t.integer :gender
      t.integer :status, default: 0
      t.integer :degree_type
      t.decimal :rate,                      precision: 10, scale: 2
      t.decimal :total_years_of_expirience, precision: 5, scale: 2
      t.decimal :stars,                     precision: 3, scale: 2
      t.text :bio
      t.string :type
      t.references :user, index: true

      t.timestamps
    end
  end
end

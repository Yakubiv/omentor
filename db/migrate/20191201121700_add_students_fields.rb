class AddStudentsFields < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :username, :string
    add_column :students, :avatar, :string
    add_column :students, :birthday, :datetime
    add_column :students, :phone, :string
    add_column :students, :dial_code, :string
    add_column :students, :city, :string
    add_column :students, :country, :string
    add_column :students, :gender, :integer
    add_column :students, :degree_type, :integer
    add_column :students, :bio, :text
  end
end

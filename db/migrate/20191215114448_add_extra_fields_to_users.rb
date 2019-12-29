class AddExtraFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :terms_and_conditions, :boolean, default: false
    add_column :users, :sign_up_as, :integer
  end
end

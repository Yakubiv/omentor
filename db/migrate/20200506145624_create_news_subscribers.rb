class CreateNewsSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :news_subscribers do |t|
      t.string :email, null: false, default: ""
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

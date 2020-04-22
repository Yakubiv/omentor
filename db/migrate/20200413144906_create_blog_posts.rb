class CreateBlogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :user_id, index: true
      t.string :url_alies
      t.string :thumbnail
      t.string :meta_tags, default: [], array: true
      t.integer :category
      t.integer :status
      t.boolean :popular, default: false
      t.string :slug
      t.datetime :publish_at
      t.integer :impressions_count, default: 0
      t.boolean :top, default: false
      t.text :meta_description
      t.string :meta_title

      t.timestamps
    end
  end
end

# Migration to add articles table
class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :published_at
      t.text :content
      t.string :url
      t.string :author
      t.integer :data_feed_id

      t.timestamps
    end

    add_index :articles, :title
    add_index :articles, :data_feed_id
    add_index :articles, :author
    add_index :articles, :url
    add_index :articles, :published_at
  end
end

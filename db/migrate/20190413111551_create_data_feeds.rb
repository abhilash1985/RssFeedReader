# Migration to add table data_feeds
class CreateDataFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :data_feeds do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end

    add_index :data_feeds, :name
    add_index :data_feeds, :url
  end
end

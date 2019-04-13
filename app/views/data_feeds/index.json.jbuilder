json.array!(@data_feeds) do |feed|
  json.extract! data_feed, :id, :name, :url, :description
  json.url data_feed_url(feed, format: :json)
end

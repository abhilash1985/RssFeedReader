# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sample_data = [
  { name: 'All News', url: 'https://www.railwaygazette.com/rss.xml', description: 'All News on Railway' },
  { name: 'RSS Passenger', url: 'https://www.railwaygazette.com/rss/rss-passenger.html', 
    description: 'All details on Passenger' },
  { name: 'RSS High Speed', url: 'https://www.railwaygazette.com/rss/rss-high-speed.html', 
    description: 'All details on High Speed' }
]

sample_data.each { |values| DataFeed.where(values).first_or_create }

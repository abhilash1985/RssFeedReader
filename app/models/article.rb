# class Article
class Article < ApplicationRecord
  # Associations
  belongs_to :data_feed
  # Validations
  validates :title, :url, :published_at, presence: true
  validates :title, :url, uniqueness: { scope: :data_feed_id }
  # Scopes
  scope :latest, -> { order('published_at desc') }
end

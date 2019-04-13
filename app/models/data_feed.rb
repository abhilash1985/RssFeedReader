require 'open-uri'
# class DataFeed to store feed Urls
class DataFeed < ApplicationRecord
  # Associations
  has_many :articles, dependent: :destroy
  # Validations
  validates :name, :url, :description, presence: true
  validates :url, uniqueness: true
  # Callbacks
  after_save :update_articles

  def update_articles
    GenerateArticleJob.perform_later(self)
  end

  def create_articles_from_feed(node2)
    article_attributes = fetch_article_attributes(node2)
    article = articles.where(title: article_attributes[:title]).first_or_initialize
    article.update_attributes(article_attributes)
    article
  end

  def validate_url(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  end

  def parse_url(url)
    valid = validate_url(url)
    return nil unless valid
    Nokogiri::XML(open(url))
  end

  def article_params
    {
      title: 'title', content: 'description', url: 'link',
      published_at: 'pubDate', author: 'category'
    }
  end

  def fetch_article_attributes(node2)
    article_params.each_with_object({}) do |(key, value), hash|
      hash[key] = fetch_values(node2, value)
    end
  end

  def fetch_values(node2, value)
    case value
    when 'description'
      fetch_content(node2)
    else
      node2.children.css(value).last.try(:inner_text)
    end
  end

  def fetch_content(node2)
    node2.children[7].children[0].inner_text
  rescue
    node2.children.css('content').last.try(:inner_text)
  rescue
    node2.children.css('description').last.try(:inner_text)
  end
end

# Background job to generate articles
class GenerateArticleJob < ApplicationJob
  queue_as :default

  def perform(data_feed)
    doc = data_feed.parse_url(data_feed.url)
    return if doc.blank?
    doc.css('channel').each do |node|
      node.children.css('item').each do |node2|
        article = data_feed.create_articles_from_feed(node2)
        Rails.logger.info "Synced Article - #{article.title} \n"
      end
      Rails.logger.info "Synced Data Feed - #{data_feed.name}}"
    end
  rescue => e
    Rails.logger.error "Exception - #{e.message}} \n"
    Rails.logger.error "Exception - #{e.backtrace}}"
  end
end

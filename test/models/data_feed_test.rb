require 'test_helper'

# DataFeedTest
class DataFeedTest < ActiveSupport::TestCase
  setup do
    @data_feed = data_feeds(:one)
    @hash = { title: 'title', content: 'description', url: 'link',
              published_at: 'pubDate', author: 'category' }
  end

  test 'update_articles' do
    assert true
  end

  test 'should not save data feed without title' do
    data_feed = DataFeed.new
    assert_not data_feed.save, I18n.t('data_feed.save_message')
  end

  test 'create_articles_from_feed' do
    assert true
  end

  test 'validate_url' do
    assert true
  end

  test 'parse_url' do
    assert true
  end

  test 'article_params' do
    assert true
    assert_equal @data_feed.article_params, @hash
  end

  test 'fetch_values' do
    assert true
  end

  test 'fetch_content' do
    assert true
  end
end

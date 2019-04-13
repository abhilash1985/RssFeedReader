require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_feed = data_feeds(:one)
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url(@data_feed)
    assert_response :success
  end

  test "should get list" do
    get articles_list_url
    assert_response :success
  end

  test "should get show" do
    get article_url(@data_feed, @article)
    assert_response :success
  end
end

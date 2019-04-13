require 'test_helper'

# DataFeedsControllerTest
class DataFeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_feed = data_feeds(:one)
  end

  test "should get index" do
    get data_feeds_url
    assert_response :success
    assert_not_nil assigns(:data_feeds)
  end

  test "should get new" do
    get new_data_feed_url
    assert_response :success
  end

  test "should create feed" do
    assert_difference('DataFeed.count') do
      post :create, params: { data_feed: { description: 'Test Description', name: 'RSS Urban', 
                              url: 'https://www.railwaygazette.com/rss/rss-urban.html' } }
    end

    assert_redirected_to data_feed_path(assigns(:data_feed))
  end

  test "should show feed" do
    get data_feed_url(@data_feed)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_feed_url(@data_feed)
    assert_response :success
  end

  test "should update feed" do
    patch data_feed_url(@data_feed), params: { data_feed: { description: @data_feed.description, 
                                                            name: @data_feed.name, 
                                                            url: @data_feed.url } }

    assert_redirected_to data_feed_path(assigns(:data_feed))
  end

  test "should destroy feed" do
    assert_difference('DataFeed.count', -1) do
      delete data_feed_url(@data_feed)
    end

    assert_redirected_to data_feeds_url
  end
end

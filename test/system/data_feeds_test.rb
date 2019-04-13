require 'application_system_test_case'

# DataFeedsTest
class DataFeedsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit data_feeds_url

    click_on 'New Data Feed'

    fill_in 'Name', with: 'Creating an Data Feed'
    fill_in 'Url', with: 'https://www.railwaygazette.com/rss.xml'
    fill_in 'Description', with: 'Description'

    click_on 'Create Data feed'

    assert_text 'Creating a Data Feed'
  end
end

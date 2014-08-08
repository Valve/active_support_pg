require_relative 'test_helper'
describe 'dasherize' do
  it 'dasherizes correctly' do
    words = {
      'api_controller' => 'api-controller',
      'nokogiri/html' => 'nokogiri/html',
      'http_api' => 'http-api',
      'i_love_pg' => 'i-love-pg',
      'person_id' => 'person-id'}
    words.each do |underscored, dasherized|
      run_pg_function(:dasherize, underscored).must_equal(dasherized)
    end
  end
end

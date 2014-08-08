require_relative 'test_helper'
describe 'humanize' do
  it 'humanizes correctly' do
    words = {
      'api_controller' => 'Api controller',
      'nokogiri/html' => 'Nokogiri/html',
      'http_api' => 'Http api',
      'i_love_pg' => 'I love pg',
      'person_id' => 'Person'}
    words.each do |inhuman, human|
      run_pg_function(:humanize, inhuman).must_equal(human)
    end
  end
end

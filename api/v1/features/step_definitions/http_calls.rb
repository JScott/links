require 'redis'
require 'httparty'

Given /^a Redis database$/ do
  test_db = 15
  @redis = Redis.new db: test_db
  @redis.flushdb
end

When /^I (.*?) to (.*?)$/ do |method, url|
  url = "http://localhost:9292#{url}"
  method = method.downcase.to_sym
  @last_response = HTTParty.method(method).call(url, @auth)
end

Then /^the response is (.*?)$/ do |expected_response|
  @last_response = @last_response.to_s.gsub('=>',':') if @last_response.is_a? Hash
  expect(@last_response.message).to eq('OK')
  expect(@last_response.body).to eq(expected_response)
end

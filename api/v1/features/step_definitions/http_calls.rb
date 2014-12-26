require 'redis'
require 'httparty'

Given /^a Redis database$/ do
  test_db = 15
  @redis = Redis.new db: test_db
  @redis.flushdb
end

#Given /^login credentials$/ do
#  @credentials = { username: 'test', password: 'password1' }
#end

When /^I (.*?) to (.*?)$/ do |method, url|
  url = "http://localhost:9292#{url}"
  method = method.downcase.to_sym
  @last_response = HTTParty.method(method).call(url, { basic_auth: @credentials, body: {} })
end

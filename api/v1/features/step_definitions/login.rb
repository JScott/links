require 'httparty'

Given /^I am logged in$/ do
  @auth = {:username => "test", :password => "password1"}
end

require 'httparty'

Given /^I am logged in$/ do
  @credentials = {:username => "test", :password => "password1"}
end

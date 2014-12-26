Then /^an array of strings is returned$/ do
  expect(@last_response).to be_an(Array)
  @last_response.each do |item|
    expect(item).to be_a(String)
  end
end

Then /^the response is not empty$/ do
  expect(@last_response).to_not be_empty
end

Then /^the response returns (.*?)$/ do |expected_response|
  @last_response = @last_response.to_s.gsub('=>',':') if @last_response.is_a? Hash
  expect(@last_response.message).to match(/OK|Created/)
  expect(@last_response.body).to eq(expected_response)
end

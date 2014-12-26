Then /^an array of strings is returned$/ do
  expect(@last_response).to be_an(Array)
  @last_response.each do |item|
    expect(item).to be_a(String)
  end
end

Then /^the response is not empty$/ do
  expect(@last_response).to_not be_empty
end

Then /^the response code is (\d+)$/ do |expected_code|
  expect(@last_response.code).to eq(expected_code.to_i)
end

Then /^the response returns (.*?)$/ do |expected_response|
  @last_response = @last_response.to_s.gsub('=>',':') if @last_response.is_a? Hash
  expect(200..299).to cover(@last_response.code)
  expect(@last_response.body).to eq(expected_response)
end

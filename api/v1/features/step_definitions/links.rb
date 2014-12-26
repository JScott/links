Then /^an array of strings is returned$/ do
  expect(@last_response).to be_an(Array)
  @last_response.each do |item|
    expect(item).to be_a(String)
  end
end

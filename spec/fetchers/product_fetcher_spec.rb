require 'rails_helper'

RSpec.describe ProductFetcher do

  it "raises exception on invalid data" do
    stub_request(:any, api_uri(1)).
    to_return(:status => 200, :body => "non_json_data", :headers => {})
    expect { ProductFetcher.fetch(1) }.to raise_error(JSON::ParserError)
  end

  it "raises exception on incompete data" do
    body = "{\"name\":\"Alexey\"}"
    stub_request(:any, api_uri(1)).
    to_return(:status => 200, :body => body, :headers => {})
    expect { ProductFetcher.fetch(1) }.to raise_error(KeyError)
  end


end

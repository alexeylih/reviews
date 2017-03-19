def api_uri(id)
  "http://api.walmartlabs.com/v1/reviews/#{id}?format=json&apiKey=#{Rails.application.secrets.wallmart_api_key}"
end

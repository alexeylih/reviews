require 'rails_helper'
WebMock.allow_net_connect!

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do
    
    it "returns a 200 ok status code" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "returns a json response" do
      get :index
      expect(response.content_type).to eq "application/json"
    end

  end

end

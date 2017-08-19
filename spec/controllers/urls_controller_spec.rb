require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  let!(:urls) { create_list(:url, 10) }

  describe "GET #index" do
    it "returns the list of urls" do
      get :index, params: {}
      expect(response.status).to eq 200
      expect(response).to match_response_schema("url_list")
    end
  end

  describe "GET #show" do
    it "returns single url" do
      get :show, params: { id: urls.first.short }
      expect(response.status).to eq 200
      expect(response).to match_response_schema("url")
    end
  end

  describe "POST #create" do
    it "creates a short url for given full and returns created object" do
      post :create, params: { data: { full: "http://www.example.com/thefancylongurl/" } }
      expect(response.status).to eq 201
      expect(response).to match_response_schema("url")
    end
  end

end

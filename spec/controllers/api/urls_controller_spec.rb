require 'rails_helper'

RSpec.describe Api::UrlsController, type: :controller do

  let(:session) {create(:session)}
  let!(:urls) { create_list(:url, 10) }
  let(:url) { urls.first }
  let(:valid_parameters) {
    {
      data: {
        full: Faker::Internet.url
      }
    }
  }

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
      expect(response).to match_response_schema("url_stat")
    end

  end

  describe "POST #create" do

    context "with valid parameters" do
      it "creates a short url for given full and returns created object" do
        post :create, params: valid_parameters
        expect(response.status).to eq 201
        expect(response).to match_response_schema("url")
      end
    end

    context "with invalid parameters" do
      it "returns error" do
        post :create, params: {}
        expect(response.status).to eq 422
      end
    end

  end

end

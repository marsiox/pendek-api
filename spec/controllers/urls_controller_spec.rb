require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  let(:session) {create(:session)}
  let!(:urls) { create_list(:url, 10) }
  let(:valid_parameters) {
    {
      data: {
        full: Faker::Internet.url
      }
    }
  }
  let(:valid_headers) {
    {
      user: {
        session_id: SecureRandom.hex,
        ip_address: Faker::Internet.ip_v4_address,
        http_referer: Faker::Internet.url('testreferer.com')
      }
    }
  }

  describe "GET #index" do
    it "returns the list of urls" do
      get :index, params: { headers: valid_headers }
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

    context "with valid parameters" do
      it "creates a short url for given full and returns created object" do
        post :create, params: valid_parameters
        expect(response.status).to eq 201
        expect(response).to match_response_schema("url")
      end
    end

  end

end

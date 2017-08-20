require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

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
    context "with valid headers" do
      before do
        @request.headers["User-Session-Id"] = SecureRandom.hex
        @request.headers["User-Ip-Addr"] = Faker::Internet.ip_v4_address
        @request.headers["User-Referer"] = Faker::Internet.url('testreferer.com')
        @request.headers["User-Agent"] = Faker::Internet.user_agent
      end
      it "returns single url" do
        get :show, params: { id: urls.first.short }
        expect(response.status).to eq 200
        expect(response).to match_response_schema("url")
      end

      it "saves session in db" do
        get :show, params: { id: urls.first.short }

        expect(url.sessions).not_to be_empty
        expect(url.sessions.last.user_session_id).to eq @request.headers["User-Session-Id"]
      end
    end

    context "with no headers" do
      it "returns error" do
        get :show, params: { id: urls.first.short }
        expect(response.status).to eq 422
      end
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

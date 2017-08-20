require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  describe "GET #show" do
    it { expect(response.status).to eq 200 }
    it { expect(response).to match_response_schema("url_stat") }
  end

end
require "rails_helper"

RSpec.describe "URL request", :type => :request do

  let(:url) { create(:url) }

  it "redirects to full url" do
    get "/", params: { id: url.short }
    expect(response.status).to eq 301
  end

end

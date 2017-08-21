require "rails_helper"

RSpec.describe RedirectionsController, :type => :controller do

  let(:url) { create(:url) }

  it "creates stats record" do
    get :index, params: { short: url.short }
    expect(Session.last.url).to eq url
  end

end

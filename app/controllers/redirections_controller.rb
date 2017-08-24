class RedirectionsController < ApplicationController

  before_action :set_url, only: [:index]
  before_action :increment_visits, only: [:index]

  def index
    if @url
      service = CreateSession.new(request, @url)
      response = service.run

      unless response.errors.empty?
        # log or notify about errors
      end

      redirect_to @url.full
    else
      redirect_to "/api"
    end
  end

  private

  def set_url
      @url = Url.find_by(short: params[:short])
    end

  def increment_visits
    @url.update(visits: @url.visits.to_i + 1)
  end

end

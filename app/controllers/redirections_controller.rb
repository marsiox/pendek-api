class RedirectionsController < ApplicationController

  def index
    if url = Url.find_by(short: params['short'])
      service = CreateSession.new(request, url)
      response = service.run

      unless response.errors.empty?
        # log or notify about errors
      end

      redirect_to url.full
    else
      redirect_to "/api"
    end
  end

end

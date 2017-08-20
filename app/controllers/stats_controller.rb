class StatsController < ApplicationController
  before_action :set_url, only: [:show]

  def show
    render json: @url, adapter: :json_api, serializer: UrlStatSerializer, key_transform: :underscore
  end

  private

    def set_url
      @url = Url.find_by(short: params[:id])
    end

end

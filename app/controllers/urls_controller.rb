class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  def index
    @urls = Url.all
    render json: @urls, adapter: :json_api
  end

  def show
    service = CreateSession.new(request.headers, @url)
    response = service.run

    if service.errors.empty?
      render json: @url, adapter: :json_api
    else
      render json: service.errors.messages, status: :unprocessable_entity, adapter: :json_api
    end

  end

  def create
    service = CreateShortUrl.new(url_params)
    response = service.run

    if service.errors.empty?
      render json: response, status: :created, adapter: :json_api
    else
      render json: service.errors.messages, status: :unprocessable_entity, adapter: :json_api
    end
  end

  private

    def set_url
      @url = Url.find_by(short: params[:id])
    end

    def url_params
      params.fetch(:data, {})
    end
end

class Api::UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  def index
    @urls = Url.all
    render json: @urls, adapter: :json_api, key_transform: :underscore
  end

  def show
    render json: @url, adapter: :json_api, serializer: UrlStatSerializer, key_transform: :underscore
  end

  def create
    service = CreateShortUrl.new(url_params)
    response = service.run

    if response.errors.empty?
      render json: response, status: :created, adapter: :json_api
    else
      render json: response.errors, status: :unprocessable_entity, adapter: :json_api
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

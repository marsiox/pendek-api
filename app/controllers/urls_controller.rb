class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  def index
    @urls = Url.all
    render json: @urls, adapter: :json_api
  end

  def show
    render json: @url, adapter: :json_api
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      render json: @url, status: :created, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  private

    def set_url
      @url = Url.find_by(short: params[:id])
    end

    def url_params
      params.fetch(:url, {})
    end
end

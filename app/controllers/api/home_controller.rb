class Api::HomeController < ApplicationController
  def index
    render json: { api_version: '0.0.1' }
  end
end
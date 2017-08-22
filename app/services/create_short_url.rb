class CreateShortUrl
  include Service
  include ActiveModel::Validations

  def initialize(params)
    @params = params
  end

  def run
    url = Url.find_or_create_by(full: @params[:full]) do |u|
      u.short = Pendek::ShortURL.print
    end
    url
  end

end

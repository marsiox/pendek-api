class CreateShortUrl
  include Service
  include ActiveModel::Validations

  def initialize(params)
    @params = params
  end

  def run
    url = Url.new
    url.full = @params["full"]
    url.short = Pendek::ShortURL.print
    url.save
    url
  end

end

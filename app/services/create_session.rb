class CreateSession
  include Service
  include ActiveModel::Validations

  def initialize(request, url)
    @request = request
    @url = url
  end

  def run
    user_session = Session.new
    user_session.url = @url
    user_session.referer = Referer.find_or_create_by(url: @request.referer)
    user_session.ip_address = @request.ip
    user_session.user_agent = @request.user_agent
    user_session.save
    user_session
  end

end

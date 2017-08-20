class CreateSession
  include Service
  include ActiveModel::Validations

  def initialize(request_headers, url)
    @request_headers = request_headers
    @url = url
  end

  def run
    session = Session.new

    session.user_session_id = @request_headers["User-Session-Id"]
    session.ip_address = @request_headers["User-Ip-Addr"]
    session.http_referer = @request_headers["User-Referer"]
    session.user_agent = @request_headers["User-Agent"]
    session.url = @url
    session.save
    session
  end

end

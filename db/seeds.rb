urls = []

50.times do
  urls << Url.create(
    full: Faker::Internet.url,
    short: Pendek::ShortURL.print
  )
end

200.times do
  Session.create({
    user_session_id: SecureRandom.hex,
    ip_address: Faker::Internet.ip_v4_address,
    http_referer: Faker::Internet.url('testreferer.com'),
    user_agent: Faker::Internet.user_agent,
    url: urls[rand(urls.count)]
  })
end

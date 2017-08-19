sessions = []
20.times do
  sessions << Session.create({
    user_session_id: SecureRandom.hex,
    ip_address: Faker::Internet.ip_v4_address,
    http_referer: Faker::Internet.url('testreferer.com'),
    user_agent: Faker::Internet.user_agent
  })
end

100.times do
  Url.create(
    session_id: sessions[rand(sessions.count)].id,
    full: Faker::Internet.url,
    short: Pendek::ShortURL.print
  )
end

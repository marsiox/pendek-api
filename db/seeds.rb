urls = []
referers = []

urls << Url.find_or_create_by(
  full: "http://www.bangkokpost.com/news/world/1310468/floods-landslides-kill-more-than-800-across-south-asia",
  short: Pendek::ShortURL.print
)
urls << Url.find_or_create_by(
  full: "http://www.bbc.com/news/world-africa-40997706",
  short: Pendek::ShortURL.print
)
urls << Url.find_or_create_by(
  full: "https://www.youtube.com/watch?v=UBGzsb2UkeY&t=1052s",
  short: Pendek::ShortURL.print
)
urls << Url.find_or_create_by(
  full: "https://seleniumhq.wordpress.com/2017/08/09/firefox-55-and-selenium-ide/",
  short: Pendek::ShortURL.print
)
urls << Url.find_or_create_by(
  full: "https://github.com/angrave/SystemProgramming/wiki",
  short: Pendek::ShortURL.print
)

10.times do
  referers << Referer.find_or_create_by(url: Faker::Internet.url)
end

100.times do
  Session.create({
    ip_address: Faker::Internet.ip_v4_address,
    referer: referers[rand(referers.count)],
    user_agent: Faker::Internet.user_agent,
    url: urls[rand(urls.count)]
  })
end

urls.each { |u| u.update(visits: Session.where(url: u).count) }

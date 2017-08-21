urls = []

urls << Url.create(
  full: "http://www.bangkokpost.com/news/world/1310468/floods-landslides-kill-more-than-800-across-south-asia",
  short: Pendek::ShortURL.print
)
urls << Url.create(
  full: "http://www.bbc.com/news/world-africa-40997706",
  short: Pendek::ShortURL.print
)
urls << Url.create(
  full: "https://www.youtube.com/watch?v=UBGzsb2UkeY&t=1052s",
  short: Pendek::ShortURL.print
)
urls << Url.create(
  full: "https://seleniumhq.wordpress.com/2017/08/09/firefox-55-and-selenium-ide/",
  short: Pendek::ShortURL.print
)
urls << Url.create(
  full: "https://github.com/angrave/SystemProgramming/wiki",
  short: Pendek::ShortURL.print
)

100.times do
  Session.create({
    ip_address: Faker::Internet.ip_v4_address,
    http_referer: Faker::Internet.url,
    user_agent: Faker::Internet.user_agent,
    url: urls[rand(urls.count)]
  })
end

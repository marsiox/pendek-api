FactoryGirl.define do
  factory :url do
    sequence :full do
      Faker::Internet.url('example.com')
    end

    sequence :short do
      Pendek::ShortURL.print
    end
  end

end

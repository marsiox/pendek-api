FactoryGirl.define do
  factory :session do
    user_session_id SecureRandom.hex
    ip_address Faker::Internet.ip_v4_address
    http_referer Faker::Internet.url('testreferer.com')
    user_agent Faker::Internet.user_agent
  end
end

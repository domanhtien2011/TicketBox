FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    username 'Somebody'
    password '12345678'
    password_confirmation '12345678'
  end
end

FactoryGirl.define do
  factory :event, :class => 'Event' do
    name 'Rails Conference'
    extended_html_description 'The best conference for Rails developers in VN'
    hero_image_url 'asdasdasdasdasds'
    starts_at Faker::Time.between(DateTime.now, Time.now, :day)
    ends_at Faker::Time.forward(14, :evening)
    venue 'Da Lat City'
    category 'Dating'
  end
end

FactoryGirl.define do
  factory :user do
    username 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
  end
end

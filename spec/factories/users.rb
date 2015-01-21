FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) { |n| "#{1000 + n}" }
    sequence(:name) { |n| "generic user ##{n}" }
    sequence(:email) { |n| "generic_user#{n}@gmail.com" }
    image "http://i.imgur.com/ZWvTHhD.jpg"
    role "student"
  end
end

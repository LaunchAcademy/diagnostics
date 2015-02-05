FactoryGirl.define do
  factory :quiz do
    sequence(:name) { |n| "Example Set #{n}" }
  end
end

FactoryGirl.define do
  factory :question_set do
    sequence(:name) { |n| "Example Set #{n}" }
  end
end

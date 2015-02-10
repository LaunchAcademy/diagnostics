FactoryGirl.define do
  factory :quiz do
    sequence(:name) { |n| "Example Set #{n}" }

    factory :quiz_with_questions do
      after(:create) do |quiz|
        create(:question_with_answers, quiz: quiz)
      end
    end
    
  end
end

FactoryGirl.define do
  factory :question_set do
    sequence(:name) { |n| "Example Set #{n}" }

    factory :question_set_with_questions do
      transient do
        questions_count 3
      end

      after(:create) do |user, evaluator|
        create_list(:question, evaluator.questions_count, question_set: question_set)
      end
    end
  end
end

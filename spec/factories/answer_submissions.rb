FactoryGirl.define do
  factory :answer_submission do
    user
    answer
    question { answer.question }
  end
end

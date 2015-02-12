FactoryGirl.define do
  factory :answer_submission do
    user
    answer
    question { answer.question }
    ip "10.0.0.256"
  end
end

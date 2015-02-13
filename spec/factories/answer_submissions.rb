FactoryGirl.define do
  factory :answer_submission do
    user
    answer
    question { answer.question }
    ip "50.241.127.209"
  end
end

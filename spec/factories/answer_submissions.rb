FactoryGirl.define do
  factory :answer_submission do
    user
    answer
    question { answer.question }
    ip ENV['LAUNCH_ACADEMY_IP']
  end
end

FactoryGirl.define do
  factory :question do
    query "What language is the Rails framework written in?"

    factory :question_with_answers do
      after(:create) do |question|
        answer_contents = %w(Ruby SQL Javascript Python)
        answer_contents.each do |answer|
          question.answers.create!(content: answer, correct: answer == "Ruby")
        end
      end
    end
  end
end

FactoryGirl.define do
  factory :question do
    query "What language is the Rails framework written in?"

    factory :question_with_answers do
      after(:create) do
        create(:answer, content: "Ruby", correct: true)
        create(:answer, content: "SQL")
        create(:answer, content: "Javascript")
        create(:answer, content: "Python")
      end
    end
  end
end

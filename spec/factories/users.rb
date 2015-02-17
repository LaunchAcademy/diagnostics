FactoryGirl.define do
  factory :user do
    provider "launch_pass"
    sequence(:uid) { |n| "#{1000 + n}" }
    sequence(:email) { |n| "generic_user#{n}@gmail.com" }
    first_name "Bob"
    last_name "Smith"
    role "student"

    factory :user_with_answered_quiz do
      after(:create) do |user|
        quiz = create(:quiz_with_questions)
        quiz.questions.each do |question|
          create(:answer_submission,
            user: user,
            question: question,
            answer: question.answers.find_by(correct: true))
        end
        Grade.grade_quiz(quiz, user)
      end
    end

  end
end

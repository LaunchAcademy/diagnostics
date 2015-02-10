require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { should have_many(:questions) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it "returns true if it has been completed by a student" do
    user = FactoryGirl.create(:user_with_answered_quiz)
    quiz = Quiz.first

    expect(quiz.completed_by_student?(user)).to eq(true)
  end

  it "returns false if it has not been completed by a student" do
    user = FactoryGirl.create(:user)
    quiz = FactoryGirl.create(:quiz_with_questions)

    expect(quiz.completed_by_student?(user)).to eq(false)
  end

  it "returns a student's score" do
    user = FactoryGirl.create(:user)
    quiz = FactoryGirl.create(:quiz_with_questions)
    question = quiz.questions.first
    FactoryGirl.create(:answer_submission,
      user: user,
      answer: question.correct_answer)

    expect(quiz.student_score(user)).to eq(1)
  end
end

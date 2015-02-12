require 'rails_helper'

RSpec.describe Grade, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:quiz) }

  it { should validate_presence_of(:correct_count) }
  it { should validate_presence_of(:incorrect_count) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:quiz) }

  describe "#self.grade_user" do
    it "returns user's count of correct vs. incorrect questions for a quiz" do
      user = FactoryGirl.create(:user)
      quiz = FactoryGirl.create(:quiz_with_questions)
      question = quiz.questions.first
      FactoryGirl.create(:answer_submission,
        user: user,
        answer: question.correct_answer
      )

      grade = Grade.grade_user(quiz, user)

      expect(grade.correct_count).to eq(1)
      expect(grade.incorrect_count).to eq(0)
    end
  end
end

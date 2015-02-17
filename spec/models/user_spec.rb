require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:answer_submissions) }

  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }

  it { should have_valid(:provider).when("launch_pass") }
  it { should_not have_valid(:provider).when(nil, "", "facebook") }

  it { should have_valid(:role).when("student", "admin") }
  it { should_not have_valid(:role).when(nil, "") }

  context "uniqueness" do
    subject { FactoryGirl.create(:user) }
    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end

  describe "#total_answered_questions" do
    it "returns user's total number of answered questions" do
      user = FactoryGirl.create(:user_with_answered_quiz)

      expect(user.total_answered_questions).to eq(1)
    end
  end

  describe "#total_correct_questions" do
    it "returns user's total number of correct questions" do
      user = FactoryGirl.create(:user)
      quiz = FactoryGirl.create(:quiz_with_questions)
      question = quiz.questions.first
      FactoryGirl.create(:answer_submission,
        user: user,
        answer: question.correct_answer
      )
      Grade.grade_quiz(quiz, user)

      expect(user.total_correct_questions).to eq(1)
    end
  end

  describe "#total_incorrect_questions" do
    it "returns user's total number of incorrect questions" do
      user = FactoryGirl.create(:user)
      quiz = FactoryGirl.create(:quiz_with_questions)
      question = quiz.questions.first
      FactoryGirl.create(:answer_submission,
        user: user,
        answer: question.answers.last
      )
      Grade.grade_quiz(quiz, user)

      expect(user.total_incorrect_questions).to eq(1)
    end
  end

  describe "#incomplete_quizzes_count" do
    it "returns user's number of incomplete quizzes" do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:quiz_with_questions)
      FactoryGirl.create(:quiz_with_questions)

      expect(user.incomplete_quizzes_count).to eq(2)
    end
  end
end

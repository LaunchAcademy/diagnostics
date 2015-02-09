require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { should have_many(:questions) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it "answers if it has been completed by a student" do
    user = FactoryGirl.create(:user_with_answered_quiz)
    bad_user = FactoryGirl.create(:user)
    quiz = Quiz.first

    expect(quiz.completed_by_student?(user)).to eq(true)
    expect(quiz.completed_by_student?(bad_user)).to eq(false)
  end

  it "returns a student's score" do
    user = FactoryGirl.create(:user_with_answered_quiz)
    quiz = Quiz.first

    expect(quiz.student_score(user)).to eq(1)
  end
end

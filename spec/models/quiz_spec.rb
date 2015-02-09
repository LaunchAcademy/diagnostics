require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { should have_many(:questions) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it "returns score for student" do
    user = FactoryGirl.create(:user_with_answered_quiz)
    quiz = Quiz.first

    expect(quiz.student_score(user)).to eq(1)
  end

  it "returns student's completion date of quiz" do
    user = FactoryGirl.create(:user_with_answered_quiz)
    time = Time.now.round
    quiz = Quiz.first

    expect(quiz.completed_at(user).round).to eq(time)
  end
end

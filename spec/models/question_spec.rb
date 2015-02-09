require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:quiz) }
  it { should have_many(:answers) }
  it { should have_many(:answer_submissions) }

  it { should validate_presence_of(:query) }

  it "returns a student's answer" do
    user = FactoryGirl.create(:user_with_answered_quiz)
    question = Question.first
    expect(question.student_answer(user)).to eq(question.correct_answer)
  end
end

require "rails_helper"

RSpec.describe QuizzesSeeder do
  let(:questions_yaml) { "#{Rails.root}/lib/assets/quizzes/example_quiz.yml" }

  it "should not create duplicate quizzes on multiple runs" do
    QuizzesSeeder.new(questions_yaml).seed!
    initial_count = Quiz.count
    QuizzesSeeder.new(questions_yaml).seed!
    expect(Quiz.count).to eq(initial_count)
  end

  it "should not create duplicate question records on multiple runs" do
    QuizzesSeeder.new(questions_yaml).seed!
    initial_count = Question.count
    QuizzesSeeder.new(questions_yaml).seed!
    expect(Question.count).to eq(initial_count)
  end

  it "should not create duplicate answer records on multiple runs" do
    QuizzesSeeder.new(questions_yaml).seed!
    initial_count = Answer.count
    QuizzesSeeder.new(questions_yaml).seed!
    expect(Answer.count).to eq(initial_count)
  end
end

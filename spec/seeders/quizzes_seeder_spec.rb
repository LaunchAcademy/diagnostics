require "rails_helper"

RSpec.describe QuizzesSeeder do
  let(:questions_yaml) { "#{Rails.root}/lib/assets/quizzes/http.yml" }

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

  it "should not raise an error when loading quizzes" do
    quizzes = Dir[Rails.root.join("lib/assets/quizzes/*.yml")]

    quizzes.each do |q|
      expect(lambda { QuizzesSeeder.new(q).seed! }).to_not raise_error
    end
  end

end

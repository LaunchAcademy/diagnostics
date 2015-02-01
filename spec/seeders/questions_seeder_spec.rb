require "rails_helper"

RSpec.describe QuestionsSeeder do
  let(:questions_yaml) { "#{Rails.root}/lib/assets/questions/example-set.yml" }

  it "should not create duplicate question records on multiple runs" do
    QuestionsSeeder.new(questions_yaml).seed!
    initial_count = Question.count
    QuestionsSeeder.new(questions_yaml).seed!
    expect(Question.count).to eq(initial_count)
  end

  it "should not create duplicate answer records on multiple runs" do
    QuestionsSeeder.new(questions_yaml).seed!
    initial_count = Answer.count
    QuestionsSeeder.new(questions_yaml).seed!
    expect(Answer.count).to eq(initial_count)
  end
end

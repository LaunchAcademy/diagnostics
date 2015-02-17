require "rails_helper"

feature "user starts a quiz" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:quiz) { FactoryGirl.create(:quiz) }

  let!(:first_question) do
    FactoryGirl.create(:question_with_answers, quiz: quiz)
  end

  let!(:second_question) do
    FactoryGirl.create(:question_with_answers, quiz: quiz)
  end

  scenario "user answers a sequence of questions" do
    sign_in(user)
    visit quiz_path(quiz)
    click_on first_question.answers.first.content
    click_on second_question.answers.first.content
    expect(page).to have_content("#{quiz.name} complete.")
  end
end

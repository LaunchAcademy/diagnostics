require "rails_helper"

feature "user starts a quiz" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:quiz) { FactoryGirl.create(:quiz) }
  let!(:first_question) { FactoryGirl.create(:question_with_answers, quiz: quiz) }
  let!(:second_question) { FactoryGirl.create(:question_with_answers, quiz: quiz) }

  scenario "user answers a sequence of questions" do
    ActionDispatch::Request.any_instance.stub(:remote_ip).and_return("50.241.127.209")
    sign_in(user)
    visit quiz_path(quiz)
    click_on first_question.answers.first.content
    click_on second_question.answers.first.content
    expect(page).to have_content("#{quiz.name} complete.")
  end
end

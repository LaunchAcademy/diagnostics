require "rails_helper"

feature "user answers a sequence of questions" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:question_set) { FactoryGirl.create(:question_set) }
  let!(:first_question) { FactoryGirl.create(:question_with_answers, question_set: question_set) }
  let!(:second_question) { FactoryGirl.create(:question_with_answers, question_set: question_set) }

  scenario "user answers a sequence of questions" do
    sign_in(user)
    visit question_set_path(question_set)
    click_on first_question.answers.first.content
    click_on second_question.answers.first.content
    expect(page).to have_content("#{question_set.name} complete.")
  end
end

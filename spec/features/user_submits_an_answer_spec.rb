require "rails_helper"

feature "user submits an answer" do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question_with_answers) }

  scenario "user submits a correct answer" do
    sign_in(user)
    visit question_path(question)
    click_on "Ruby"
    expect(page).to have_content("Correct!")
  end

  scenario "user submits an incorrect answer" do
    sign_in(user)
    visit question_path(question)
    click_on "SQL"
    expect(page).to have_content("Sorry, that was incorrect.")
  end
end

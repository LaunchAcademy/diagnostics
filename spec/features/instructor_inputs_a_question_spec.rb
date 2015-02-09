require 'rails_helper'


feature "Instructor Inputs a Question", %(
  As an instructor
  I want to add a new question
  So that I can test student's knowledge.

  Acceptance Criteria:
  * [] I can navigate to a page to input a new question.
  * [] I must input a question, a correct answer, as well as one
  or more incorrect answers.
  * [] If I forget one of these fields, I am presented with errors.
) do

  let(:admin) { FactoryGirl.create(:user, role: "admin") }

  scenario "admin creates a question" do
    sign_in(admin)

    visit new_admin_question_path
    fill_in "Query", with: "What language do we use for databases?"
    click_on "Ask question!"

    expect(page).to have_content "New question created. Awaiting answers."
  end

  scenario "unauthenticated user visits new question path" do
    visit new_admin_question_path
    expect(page).to have_content("Unauthorized")
  end

  scenario "regular user visits new question path" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit new_admin_question_path

    expect(page).to have_content("Unauthorized")
  end
end

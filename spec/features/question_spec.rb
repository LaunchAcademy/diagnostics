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
  scenario "create a question" do
    visit new_question_path
    fill_in "Query", with: "What language do we use for databases?"
    click_on "Ask question!"
    expect(page).to have_content "New question created. Awaiting answers."
  end


end

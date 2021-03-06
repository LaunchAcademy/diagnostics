require "rails_helper"

feature "Instructor Creates an Answer" do

  let(:question) { FactoryGirl.create(:question) }

  scenario "user adds an answer" do
    pending "Going to pick up on this feature later."
    visit new_admin_question_answer_path(question)
    fill_in "Content", with: "SQL"
    click_on "Create Answer"
    expect(page).to have_content("New answer created")
  end
end

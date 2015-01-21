require "rails_helper"

feature "user is redirected to question after sign in" do
  let(:question) { FactoryGirl.create(:question) }

  scenario "user signs in after visiting question" do
    user = FactoryGirl.create(:user)
    mock_omniauth_for(user)

    visit question_path(question)

    expect(page).to have_content("Signed in!")
    expect(page).to have_content(question.query)
  end

  scenario "unauthenticated user attempts to visit a question" do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    visit question_path(question)
    expect(page).to have_content("Error signing in!")
  end
end

require "rails_helper"

feature "user authentication" do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    mock_omni_auth_for(user)
  end

  scenario "user signs in" do
    visit root_path
    click_on "Sign in with GitHub"
    expect(page).to have_content("Welcome, #{user.name}!")
  end

  scenario "user signs out" do
    visit root_path
    click_on "Sign in with GitHub"
    click_on "Sign out"
    expect(page).to have_content("Signed out!")
  end
end

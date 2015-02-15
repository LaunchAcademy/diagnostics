require "rails_helper"

feature "user authentication", focus: true do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    mock_omniauth_for(user)
  end

  scenario "user signs in" do
    visit root_path
    click_on "Sign in with LaunchPass"
    expect(page).to have_content("Welcome, #{user.name}!")
  end

  scenario "user signs out" do
    visit root_path
    click_on "Sign in with LaunchPass"
    click_on "Sign out"
    expect(page).to have_content("Signed out!")
  end
end

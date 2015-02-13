require "rails_helper"

feature "admin views question stats" do
  context "user is admin" do
    scenario "admin views index with questions" do
      admin = FactoryGirl.create(:user, role: "admin")
      question = FactoryGirl.create(:question)

      sign_in(admin)
      visit admin_questions_path

      expect(page).to have_content(question.query)
      expect(page).to have_content(question.answer_submissions.count)
    end
  end

  context "user is student" do
    scenario "user tries to view index with questions" do
      user = FactoryGirl.create(:user)

      sign_in(user)
      visit admin_questions_path

      expect(page).to have_content("Unauthorized")
    end
  end
end

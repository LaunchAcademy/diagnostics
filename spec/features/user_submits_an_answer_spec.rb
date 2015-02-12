require "rails_helper"

feature "user submits an answer" do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question_with_answers) }

  scenario "user submits a correct answer" do
    Timecop.freeze(Time.local(2014, 7, 21, 9, 0, 0)) do  # 9AM Monday
      page.driver.options[:headers] = {'REMOTE_IP' => "10.0.0.256"}
      sign_in(user)

      visit question_path(question)
      click_on "Ruby"

      expect(page).to have_content("Correct!")
    end
  end

  scenario "user submits an incorrect answer" do
    Timecop.freeze(Time.local(2014, 7, 21, 9, 0, 0)) do  # 9AM Monday
      page.driver.options[:headers] = {'REMOTE_IP' => "10.0.0.256"}
      sign_in(user)

      visit question_path(question)
      click_on "SQL"

      expect(page).to have_content("Sorry, that was incorrect.")
    end
  end

  scenario "user tries same question twice" do
    Timecop.freeze(Time.local(2014, 7, 21, 9, 0, 0)) do  # 9AM Monday
      page.driver.options[:headers] = {'REMOTE_IP' => "10.0.0.256"}
      sign_in(user)

      visit question_path(question)
      click_on "SQL"
      visit question_path(question)
      click_on "SQL"

      expect(page).to have_content("You already answered that question.")
    end
  end
end

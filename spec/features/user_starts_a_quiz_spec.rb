require "rails_helper"

feature "user starts a quiz" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:quiz) { FactoryGirl.create(:quiz) }

  let!(:first_question) do
    FactoryGirl.create(:question_with_answers, quiz: quiz)
  end

  let!(:second_question) do
    FactoryGirl.create(:question_with_answers, quiz: quiz)
  end

  scenario "user answers a sequence of questions" do
    ActionDispatch::Request.any_instance.stub(:remote_ip).
      and_return(ENV['LAUNCH_ACADEMY_IP'])

    sign_in(user)
    visit quiz_path(quiz)
    within(all('.new_answer_submission').first) { click_on 'X' }
    within(all('.new_answer_submission').first) { click_on 'X' }
    expect(page).to have_content("#{quiz.name} complete.")
  end
end

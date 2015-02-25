require 'rails_helper'

feature "Student is Redirected to Last Unanswered Question", %(
  As a student
  I want to be redirected to my last unanswered question when I click on
    an incomplete quiz
  So that I can avoid re-answering questions if I leave and come back.

  Acceptance Criteria:
  * [] If a student has only partially completed a quiz, clicking the link to
       complete the quiz should bring the student to the first question in the quiz
       that they have not yet answered.
) do

  let(:user) { FactoryGirl.create(:user) }
  let!(:quiz) { FactoryGirl.create(:quiz) }

  let!(:first_question) do
    FactoryGirl.create(:question_with_answers, quiz: quiz)
  end

  let!(:second_question) do
    FactoryGirl.create(:question_with_answers, quiz: quiz, query: "Second query")
  end

  scenario "student returns to unanswered quiz" do
    ActionDispatch::Request.any_instance.stub(:remote_ip).and_return(ENV['LAUNCH_ACADEMY_IP'])
    sign_in(user)
    visit quiz_path(quiz)
    within(all('.new_answer_submission').first) { click_on 'X' }

    visit quizzes_path
    click_link "Complete Quiz Now"

    expect(page).to have_content(second_question.query)

    within(all('.new_answer_submission').first) { click_on 'X' }
    expect(page).to have_content("#{quiz.name} complete.")
  end

end

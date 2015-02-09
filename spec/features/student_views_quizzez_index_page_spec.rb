require 'rails_helper'

feature "Student Views Quizzes Index Page", %(
As a student
I want to see all of the quizzes assigned to me
So that I can know what I have and have not completed.

Acceptance Criteria:
* [x] Display number of questions answered correctly per quiz.
* [x] Display number of questions answered incorrectly per quiz.
* [x] Link to the start of the quiz if it isn't complete.
* [x] Link to the summary of the quiz if it is complete.
) do

  let(:user) { FactoryGirl.create(:user_with_answered_quiz) }

  scenario "student views index with finished and unfinished quizzes" do
    sign_in(user)
    unfinished_quiz = FactoryGirl.create(:quiz_with_questions)

    visit quizzes_path

    expect(page).to have_content "Total Correct Answers: 1"
    expect(page).to have_content "Total Incorrect Answers: 0"
    expect(page).to have_content unfinished_quiz.name
    expect(page).to have_content "1/1"
    expect(page).to have_content unfinished_quiz.created_at.day
    expect(page).to have_link "View Answers"
    expect(page).to have_link "Complete Quiz"
  end
end

require "rails_helper"

feature "user views quiz summary", %q(
  As as student
  I want to see a summary of the quiz I have completed
  So that I know how well I understood the material.

  Acceptance Criteria:
  [x] User's total score for the quiz is displayed
  [x] User's completion date for the quiz is displayed
  [x] All questions in the quiz should be listed
  [x] For each question, all answer options are listed
  [x] Correct answer for each question is marked
  [x] User's answer for each question is marked
) do

  let(:user) { FactoryGirl.create(:user_with_answered_quiz) }

  scenario "user views quiz summary page" do
    sign_in(user)
    quiz = Quiz.first
    visit quiz_questions_path(quiz)

    sample_question = quiz.questions.first
    correct_answer = sample_question.correct_answer
    user_answer = sample_question.student_answer(user)

    expect(page).to have_content(quiz.student_score(user))
    expect(page).to have_content(quiz.completed_at(user).day)
    expect(page).to have_content(quiz.name)
    expect(page).to have_content(sample_question.query)
    sample_question.answers.each do |answer|
      expect(page).to have_content(answer.content)
    end
    expect(page).to have_selector(".answer.student-choice")
    expect(page).to have_selector(".answer.correct")
  end

end

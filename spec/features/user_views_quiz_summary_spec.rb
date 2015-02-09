require "rails_helper"

feature "user views quiz summary", %q(
  As as student
  I want to see a summary of the quiz I have completed
  So that I know how well I understood the material.

  Acceptance Criteria:
  [] User's total score for the quiz is displayed
  [] User's completion date for the quiz is displayed
  [] All questions in the quiz should be listed
  [] For each question, all answer options are listed
  [] Correct answer for each question is marked
  [] User's answer for each question is marked
) do

  let(:user) { FactoryGirl.create(:user_with_answered_quiz) }

  scenario "user views quiz summary page", focus: true do
    sign_in(user)
    visit quiz_questions_path(quiz)

    quiz = Quiz.first
    sample_question = quiz.questions.first
    correct_answer = sample_question.answers.find_by(correct: true)
    user_answer = sample_question.student_answer(user)

    expect(page).to have_content(quiz.name)
    expect(page).to have_content(sample_question.query)
    sample_question.answers.each do |answer|
      expect(page).to have_content(answer.content)
    end
    expect(page).to have_selector(".your-answer")
    expect(page).to have_selector(".correct-answer")
  end

end

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


  before(:each) do
    @user = FactoryGirl.create(:user)
    @quiz = FactoryGirl.create(:quiz_with_questions)
    @question = @quiz.questions.first
    FactoryGirl.create(:answer_submission,
      user: @user,
      answer: @question.correct_answer
    )
    Grade.grade_user(@quiz, @user)
  end

  scenario "user views quiz summary page" do
    sign_in(@user)
    visit quiz_questions_path(@quiz)

    expect(page).to have_content(@quiz.student_score(@user))
    expect(page).to have_content(@quiz.completed_at(@user).day)
    expect(page).to have_content(@quiz.name)
    expect(page).to have_content(@question.query)
    @question.answers.each do |answer|
      expect(page).to have_content(answer.content)
    end
    expect(page).to have_selector(".answer.student-choice")
    expect(page).to have_selector(".answer.correct")
  end

end

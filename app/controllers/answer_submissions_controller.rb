class AnswerSubmissionsController < ApplicationController
  def create
    @answer_submission = AnswerSubmission.new(answer_submission_params)
    @answer_submission.user = current_user
    @answer_submission.question = @answer_submission.answer.question

    if @answer_submission.save
      if @answer_submission.answer.correct?
        flash[:success] = "Correct!"
      else
        flash[:alert] = "Sorry, that was incorrect."
      end

      question = @answer_submission.question
      question_set = @answer_submission.question.question_set
      next_index = question_set.questions.index(question) + 1
      next_question = question_set.questions[next_index]

      if next_question
        redirect_to next_question
      else
        flash[:info] = "#{question_set.name} complete."
        redirect_to root_path
      end
    else
      flash[:alert] = @answer_submission.errors.messages.values.flatten.join(' ')
      redirect_to root_path
    end
  end

  protected
  def answer_submission_params
    params.require(:answer_submission).permit(:answer_id)
  end
end

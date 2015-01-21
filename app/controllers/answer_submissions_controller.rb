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
    else
      flash[:alert] = @answer_submission.errors.messages.values.flatten.join(' ')
    end
    redirect_to root_path
  end

  protected
  def answer_submission_params
    params.require(:answer_submission).permit(:answer_id)
  end
end

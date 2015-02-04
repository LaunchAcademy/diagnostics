class QuestionSetsController < ApplicationController
  def show
    question_set = QuestionSet.find(params[:id])
    if question_set
      redirect_to question_set.questions.first
    else
      flash[:alert] = "Question Set does not exist!"
      redirect_to root_path
    end
  end
end

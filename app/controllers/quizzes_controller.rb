class QuizzesController < ApplicationController
  def show
    quiz = Quiz.find(params[:id])
    if quiz
      redirect_to quiz.questions.first
    else
      flash[:alert] = "Question Set does not exist!"
      redirect_to root_path
    end
  end
end

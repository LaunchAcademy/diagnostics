class QuizzesController < ApplicationController
  before_action :authorize_user, only: [:index]

  def index
    @quizzes = Quiz.all
  end

  def show
    quiz = Quiz.find(params[:id])
    if quiz
      redirect_to quiz.questions.first
    else
      flash[:alert] = "Quiz does not exist!"
      redirect_to root_path
    end
  end
end

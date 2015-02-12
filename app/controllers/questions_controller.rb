class QuestionsController < ApplicationController
  before_action :authorize_user, only: [:show, :index]

  def index
    @quiz = Quiz.find(params[:quiz_id])
    @questions = @quiz.questions
  end

  def show
    @question = Question.find(params[:id])
  end
end

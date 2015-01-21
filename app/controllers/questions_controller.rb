class QuestionsController < ApplicationController
  before_action :authorize_admin, only: [:new, :create]
  before_action :authorize_user, only: [:show]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "New question created. Awaiting answers."
      redirect_to new_question_path
    else
      flash[:notice] = "Something went wrong."
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:query)
  end
end

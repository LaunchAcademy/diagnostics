class QuestionsController < ApplicationController
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

  private

  def question_params
    params.require(:question).permit(:query)
  end
end

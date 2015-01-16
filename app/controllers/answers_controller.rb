class AnswersController < ApplicationController
  def new
  end

  def create
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end

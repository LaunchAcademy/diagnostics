class QuestionsController < ApplicationController
  before_action :authorize_user, only: [:show]

  def show
    @question = Question.find(params[:id])
  end
end

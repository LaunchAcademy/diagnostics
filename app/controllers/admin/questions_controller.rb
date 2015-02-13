class Admin::QuestionsController < AdminController
  def index
    @questions = Question.all.limit(20)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = "New question created. Awaiting answers."
      redirect_to new_admin_question_path
    else
      flash[:success] = "Something went wrong."
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:query)
  end

end

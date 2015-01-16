class Question < ActiveRecord::Base
  has_many :question_answers
  has_many :answers,
    through: :question_answers

  validates :query, presence: true

  def correct(answer)
    qa = QuestionAnswer.where(question: self, answer: answer)
    qa.correct?
  end
end

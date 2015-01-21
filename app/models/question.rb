class Question < ActiveRecord::Base
  has_many :answers
  has_many :answer_submissions

  validates :query, presence: true

  def correct_answer
    answers.each do |answer|
      return answer if answer.correct?
    end
  end
end

class Quiz < ActiveRecord::Base
  has_many :questions

  validates :name, presence: true
  validates :name, uniqueness: true

  def completed_by_student?(user)
    questions.all? do |q|
      completed_answers = AnswerSubmission.
        includes(:question).
        where(user: user, questions: { quiz_id: self.id })

      !completed_answers.empty?
    end
  end

  def student_score(user)
    AnswerSubmission.includes(:answer).where(answers: { correct: true} ).count
  end

end
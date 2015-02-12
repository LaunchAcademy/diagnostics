class Quiz < ActiveRecord::Base
  has_many :questions
  has_many :grades
  has_many :users,
    through: :grades

  validates :name, presence: true
  validates :name, uniqueness: true

  def completed_at(user)
    AnswerSubmission.where(user: user, question: self.questions).last.created_at
  end

  def completed_by_student?(user)
    questions.all? do |q|
      completed_answers = AnswerSubmission.
        includes(:question).
        where(user: user, questions: { quiz_id: self.id })
      !completed_answers.empty?
    end
  end

  def student_score(user)
    grades.find_by(user: user).correct_count
  end
end

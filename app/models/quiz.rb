class Quiz < ActiveRecord::Base
  has_many :questions
  has_many :grades
  has_many :users,
    through: :grades

  validates :name, presence: true
  validates :name, uniqueness: true

  def completed_at(user)
    grades.find_by(user: user).try(:created_at)
  end

  def completed_by_student?(user)
    questions.all? do |question|
      completed_answers = AnswerSubmission.
        includes(:question).
        where(user: user, question: question, questions: { quiz_id: id })
      !completed_answers.empty?
    end
  end

  def student_score(user)
    grades.find_by(user: user).try(:correct_count) || 0
  end

  def first_unanswered_question(user)
    last_question = nil
    questions.each do |question|
      if !question.student_answer(user)
        last_question = question
        break
      end
    end
    last_question
  end
end

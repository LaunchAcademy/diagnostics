class Quiz < ActiveRecord::Base
  has_many :questions

  validates :name, presence: true
  validates :name, uniqueness: true

  def student_score(user)
    score = 0
    questions.each do |question|
      if AnswerSubmission.where(user: user,
          question: question,
          answer: question.correct_answer)
        score += 1
      end
    end
    score
  end

  def completed_at(user)
    AnswerSubmission.where(user: user, question: self.questions).last.created_at
  end

end

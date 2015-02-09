class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers
  has_many :answer_submissions

  validates :query, presence: true

  def correct_answer
    answers.each do |answer|
      return answer if answer.correct?
    end
  end

  def correct_submissions_count
    result = 0
    answer_submissions.each do |submission|
      result += 1 if submission.answer.correct?
    end
    return result
  end

  def student_answer(user)
    answers.each do |answer|
      if AnswerSubmission.find_by(question: self, user: user, answer: answer)
        return answer
      end
    end
  end

end

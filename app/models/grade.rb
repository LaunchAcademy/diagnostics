class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  validates :correct_count, presence: true
  validates :incorrect_count, presence: true
  validates :user, presence: true
  validates :quiz, presence: true

  def self.grade_quiz(quiz, user)
    answer_subs = AnswerSubmission.where(user: user, question: quiz.questions)

    correct = answer_subs.inject(0) { |sum, a| sum + (a.answer.correct ? 1 : 0) }
    incorrect = answer_subs.inject(0) { |sum, a| sum + (!a.answer.correct ? 1 : 0) }

    create(correct_count: correct,
      incorrect_count: incorrect,
      user: user,
      quiz: quiz)
  end

end

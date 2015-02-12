class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  validates :correct_count, presence: true
  validates :incorrect_count, presence: true
  validates :user, presence: true
  validates :quiz, presence: true

  def self.grade_user(quiz, user)
    answer_subs = AnswerSubmission.where(user: user, question: quiz.questions)

    correct = answer_subs.inject(0) { |sum, a| sum + 1 if a.answer.correct }
    incorrect = answer_subs.inject(0) { |sum, a| sum + 1 if !a.answer.correct }

    correct ||= 0
    incorrect ||= 0

    create(correct_count: correct,
      incorrect_count: incorrect,
      user: user,
      quiz: quiz)
  end

end

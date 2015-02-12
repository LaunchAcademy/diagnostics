class User < ActiveRecord::Base
  has_many :answer_submissions

  validates :name, presence: true
  validates :provider, presence: true
  validates :provider, inclusion: { in: %w(github) }
  validates :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }
  validates :role, inclusion: { in: %w(student admin) }

  def self.find_or_create_via_omniauth(auth)
    return nil if auth.nil? || auth.empty?

    user = User.find_or_initialize_by(provider: auth['provider'], uid: auth['uid'])
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.image = auth['info']['image']
    user.save!
    user
  end

  def admin?
    role == "admin"
  end

  def is_present?(date=Date.current)
    AnswerSubmission.on_date(date).where(user: self).count > 0
  end

  def total_answered_questions
    AnswerSubmission.where(user: self).count
  end

  def total_correct_questions
    AnswerSubmission.includes(:answer).where(answers: {correct: true}).count
  end

  def total_incorrect_questions
    total_answered_questions - total_correct_questions
  end

  def incomplete_quizzes_count
    Quiz.all.to_a.count { |quiz| !quiz.completed_by_student?(self) }
  end

end

class User < ActiveRecord::Base
  has_many :answer_submissions
  has_many :grades
  has_many :quizzes,
    through: :grades

  validates :provider, presence: true
  validates :provider, inclusion: { in: %w(launch_pass) }
  validates :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }
  validates :role, inclusion: { in: %w(student admin) }

  def self.find_or_create_via_omniauth(auth)
    return nil if auth.nil? || auth.empty?

    user = User.find_or_initialize_by(provider: auth['provider'], uid: auth['uid'])
    user.first_name = auth['info']['first_name']
    user.last_name = auth['info']['last_name']
    user.email = auth['info']['email']
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
    total_correct_questions + total_incorrect_questions
  end

  def total_correct_questions
    grades.inject(0) { |sum, grade| sum + grade.correct_count }
  end

  def total_incorrect_questions
    grades.inject(0) { |sum, grade| sum + grade.incorrect_count }
  end

  def incomplete_quizzes_count
    (Quiz.all - quizzes).count
  end

end

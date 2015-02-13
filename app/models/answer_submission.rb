class AnswerSubmission < ActiveRecord::Base

  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates :user, presence: true
  validates :question, presence: true
  validates :answer, presence: true

  validates :user, uniqueness: { scope: :question,
    message: "You already answered that question." }

  validate :ip_must_be_local
  validate :time_of_answer_must_be_valid

  def self.on_date(date)
    where('DATE(created_at) = ?', date)
  end

  def valid_location?
    ip == ENV['LAUNCH_ACADEMY_IP']
  end

  def valid_time?
    current_time = Time.now
    weekends = %w(Saturday Sunday)
    if weekends.include?(current_time.strftime("%A"))
      return false
    end

    start_time = Time.zone.parse("9:00")
    end_time = Time.zone.parse("17:00")

    if !((start_time <= current_time) && (current_time <= end_time))
      return false
    end
    true
  end

  def ip_must_be_local
    errors.add(:ip, "must be local to Launch Academy to answer a quiz.") if
      !valid_location?
  end

  def time_of_answer_must_be_valid
    errors.add(:created_at, "must be during the work day") if
      !valid_time?
  end
end

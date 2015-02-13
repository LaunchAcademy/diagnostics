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

  def self.on_date(date)
    where('DATE(created_at) = ?', date)
  end

  def valid_location?
    ip == ENV['LAUNCH_ACADEMY_IP']
  end

  def ip_must_be_local
    errors.add(:ip, "must be local to Launch Academy to answer a quiz.") if
      !valid_location?
  end
end

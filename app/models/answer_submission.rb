class AnswerSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates :user, presence: true
  validates :question, presence: true
  validates :answer, presence: true

  validates :user, uniqueness: { scope: :question,
    message: "You already answered that question." }

  def self.on_date(date)
    where('DATE(created_at) = ?', date)
  end
end

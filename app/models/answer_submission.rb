class AnswerSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  validates :user, presence: true
  validates :answer, presence: true
end

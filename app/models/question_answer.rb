class QuestionAnswer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer

  validates :question, presence: true
  validates :answer, presence: true
end

class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :answer_submissions

  validates :question, presence: true
  validates :content, presence: true
  validates :correct, inclusion: { in: [true, false] }
end

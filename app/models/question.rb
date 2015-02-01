class Question < ActiveRecord::Base
  belongs_to :question_set
  has_many :answers

  validates :query, presence: true
end

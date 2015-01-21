class Question < ActiveRecord::Base
  has_many :answers
  
  validates :query, presence: true
end

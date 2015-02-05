class Quiz < ActiveRecord::Base
  has_many :questions

  validates :name, presence: true
  validates :name, uniqueness: true
end

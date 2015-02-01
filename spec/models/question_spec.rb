require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:question_set) }
  it { should have_many(:answers) }

  it { should validate_presence_of(:query) }
end

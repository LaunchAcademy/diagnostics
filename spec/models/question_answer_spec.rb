require 'rails_helper'

RSpec.describe QuestionAnswer, type: :model do
  it { should belong_to(:question) }
  it { should belong_to(:answer) }

  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }
end

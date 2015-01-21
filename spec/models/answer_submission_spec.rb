require 'rails_helper'

RSpec.describe AnswerSubmission, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should belong_to(:answer) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }
end

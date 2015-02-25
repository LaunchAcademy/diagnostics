require 'rails_helper'

RSpec.describe AnswerSubmission, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should belong_to(:answer) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }

  describe "#valid_location?" do
    it "should return true if IP is in a valid location" do
      answer = FactoryGirl.create(:answer_submission)

      expect(answer.valid_location?).to eq(true)
    end
  end

  it "should raise an error if IP is in an invalid location" do
    pending "turned this feature off except for when in production"
    answer = FactoryGirl.build(:answer_submission, ip: "10.0.0.256")
    answer.save

    expect(answer.errors.full_messages).to include("Ip must be local to Launch Academy to answer a quiz.")
  end
end

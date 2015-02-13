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
    answer = FactoryGirl.build(:answer_submission, ip: "10.0.0.256")
    answer.save

    expect(answer.errors.full_messages).to include("Ip must be local to Launch Academy to answer a quiz.")
  end

  describe "#valid_time" do
    # it "should return true if creation time is during workday" do
    #   answer = FactoryGirl.build(:answer_submission)
    #
    #   expect(answer.valid_time?).to eq(true)
    # end

    # it "should return false if creation time is not during workday", focus: true do
    #   Timecop.freeze(Time.local(2015, 2, 10, 9, 0, 0)) do  # 9AM Tuesday
    #     ActionDispatch::Request.any_instance.stub(:remote_ip).and_return("50.241.127.209")
    #     answer = FactoryGirl.create(:answer_submission)
    #     binding.pry
    #     expect(answer.erro).to eq(false)
    #   end
    # end
  end
end

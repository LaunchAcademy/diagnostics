require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:answer_submissions) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }

  it { should have_valid(:provider).when("github") }
  it { should_not have_valid(:provider).when(nil, "", "facebook") }

  it { should have_valid(:role).when("student", "admin") }
  it { should_not have_valid(:role).when(nil, "") }

  context "uniqueness" do
    before(:each) do
      user = FactoryGirl.create(:user)
    end

    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end
end

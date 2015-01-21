require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:uid) }

  context "uniqueness" do
    before(:each) do
      user = FactoryGirl.create(:user)
    end

    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end
end

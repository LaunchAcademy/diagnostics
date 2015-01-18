require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should have_many(:questions) }

  it { should validate_presence_of(:content) }

  it { should have_valid(:correct).when(true, false) }
  it { should_not have_valid(:correct).when(nil, "") }
end

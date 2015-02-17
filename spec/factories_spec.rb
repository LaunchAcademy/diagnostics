require "rails_helper"

RSpec.describe "Factories" do
  FactoryGirl.factories.map(&:name).each do |factory|
    it "has a valid #{factory} factory" do
      expect(FactoryGirl.build(factory)).to be_valid
    end

    traits = FactoryGirl.factories[factory].definition.defined_traits
    traits.map(&:name).each do |trait_name|
      context "with trait #{trait_name}" do
        it "is valid" do
          factory = FactoryGirl.build(factory, trait_name)
          if factory.respond_to?(:valid?)
            expect(factory).to be_valid,
              lambda { factory.errors.full_messages.join("\n") }
          end
        end
      end
    end

  end
end

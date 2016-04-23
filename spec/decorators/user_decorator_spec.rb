require "rails_helper"

describe UserDecorator do
  let(:user) { build :user, full_name: "Test Name", email: "123@example.com" }
  let(:decorator) { user.decorate }

  describe "#full_name_with_email" do
    it "returns full_name with email" do
      expect(decorator.full_name_with_email).to eq("Test Name (123@example.com)")
    end
  end
end

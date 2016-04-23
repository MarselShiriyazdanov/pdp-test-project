require "rails_helper"

describe ArticlePolicy do
  let(:user) { build :user, admin: admin }
  let(:article) { build :article }
  let(:policy) { described_class.new(user, article) }

  describe "#manage?" do
    context "when there no user" do
      let(:user) { nil }

      it "disallows to managea rticle" do
        expect(policy.manage?).to be nil
      end
    end

    context "when user is admin user" do
      let(:admin) { true }

      it "allows to manage article" do
        expect(policy.manage?).to be true
      end
    end

    context "when user is regular user" do
      let(:admin) { false }

      it "disallows to manage article" do
        expect(policy.manage?).to be false
      end
    end
  end
end

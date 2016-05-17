require "rails_helper"

describe ArticlePolicy do
  let(:user) { build :user }
  let(:article) { build :article }
  let(:policy) { described_class.new(user, article) }

  describe "#manage?" do
    context "when there no user" do
      let(:user) { nil }

      it "disallows to update article" do
        expect(policy.update?).to be nil
      end
    end

    context "when user is not article's author" do
      it "allows to update article" do
        expect(policy.update?).to be false
      end
    end

    context "when user is article's author" do
      let(:article) { build :article, user: user }

      it "allows to update article" do
        expect(policy.update?).to be true
      end
    end
  end
end

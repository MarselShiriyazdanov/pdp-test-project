require "rails_helper"

RSpec.describe Comment do
  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :article }
end

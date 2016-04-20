require "rails_helper"

feature "View Dashboard" do
  let(:user) { create :user, :confirmed }
  let!(:article) { create :article }
  let(:index_page) { Dashboard::Index.new }

  before do
    login_as(user, scope: :user)
    index_page.load
  end

  scenario "User views dashboard with articles" do
    expect(index_page).to have_article
  end

  scenario "User views dashboard" do
    expect(index_page).to have_top_bar text: I18n.t("titles.application")
  end
end

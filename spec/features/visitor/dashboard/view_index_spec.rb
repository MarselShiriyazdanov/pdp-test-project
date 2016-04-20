require "rails_helper"

feature "View Dashboard" do
  let(:user) { create :user, :confirmed }
  let!(:article) { create :article }

  before do
    login_as(user, scope: :user)
    visit root_path
  end

  scenario "User views dashboard with articles" do
    expect(page).to have_content(article.text)
  end

  scenario "User views dashboard" do
    expect(page).to have_text(I18n.t("titles.application"))
  end
end

require "rails_helper"

feature "View Article" do
  let(:user) { create :user, :confirmed }
  let(:article) { create :article }

  before do
    login_as(user, scope: :user)
    visit article_path(article)
  end

  scenario "User views article" do
    expect(page).to have_content(article.text)
  end
end

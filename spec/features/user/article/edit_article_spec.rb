require "rails_helper"

feature "Edit Article" do
  let(:user) { create :user, :confirmed }
  let(:article) { create :article, user: user }

  before do
    login_as(user, scope: :user)
    visit edit_article_path(article)
  end

  context "when user is article's author" do
    scenario "User successfully updates article" do
      fill_form(:article, title: "New title", text: "New text")
      click_button "Update Article"

      expect(page).to have_content(I18n.t("flash_notices.article_updated"))
    end

    scenario "User submits article without necessary attributes" do
      fill_form(:article, title: "New title", text: "")
      click_button "Update Article"

      expect(page).to have_content("Article could not be updated.")
    end
  end

  context "when user tries to edit another author's article" do
    let(:user) { create :user, :confirmed }
    let(:article) { create :article }

    scenario "User visit edit article path" do
      expect(page).to have_content(I18n.t("forbidden_page.text"))
    end
  end
end

require "rails_helper"

feature "Edit Article" do
  let(:user) { create :user, :confirmed, admin: true }
  let(:article) { create :article }

  before do
    login_as(user, scope: :user)
    visit edit_article_path(article)
  end

  context "Admin user" do
    scenario "User successfully updates article" do
      fill_form(:article, title: "New title", text: "New text")
      click_button "Update Article"

      expect(page).to have_content(I18n.t("flash_notices.article_updated"))
    end

    scenario "User submits article without necessary attributes" do
      fill_form(:article, title: "New title", text: "")
      click_button "Update Article"

      expect(page).to have_content("Text can't be blank")
    end
  end

  context "Regular user" do
    let(:user) { create :user, :confirmed }

    scenario "User visit edit article path" do
      expect(page).to have_content(I18n.t("forbidden_page.text"))
    end
  end
end

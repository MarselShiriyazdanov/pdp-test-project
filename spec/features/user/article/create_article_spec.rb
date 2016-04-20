require "rails_helper"

feature "Create Article" do
  let(:user) { create :user, :confirmed, admin: true }
  let(:title) { "123" }
  let(:text) { "333" }

  before do
    login_as(user, scope: :user)
    visit new_article_path
  end

  context "Admin user" do
    scenario "User successfully submits new article" do
      fill_form(:article, title: title, text: text)
      click_button "Create Article"

      expect(page).to have_content(I18n.t("flash_notices.article_created"))
    end

    scenario "User submits article without necessary attribute" do
      fill_form(:article, title: title)
      click_button "Create Article"

      expect(page).to have_content("Text can't be blank")
    end
  end

  context "Regular user" do
    let(:user) { create :user, :confirmed }

    scenario "User visit new article path" do
      expect(page).to have_content(I18n.t("forbidden_page.text"))
    end
  end
end

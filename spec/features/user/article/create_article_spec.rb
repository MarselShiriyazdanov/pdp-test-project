require "rails_helper"

feature "Create Article" do
  let(:user) { create :user, :confirmed }
  let(:title) { "123" }
  let(:text) { "333" }

  before do
    login_as(user, scope: :user)
    visit new_article_path
  end

  scenario "User successfully submits new article" do
    fill_form(:article, title: title, text: text)
    click_button "Create Article"

    expect(page).to have_content(I18n.t("flash_notices.article_created"))
  end

  scenario "User submits article without necessary attribute" do
    fill_form(:article, title: title)
    click_button "Create Article"

    expect(page).to have_content("Article could not be created.")
  end
end

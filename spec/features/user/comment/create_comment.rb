require "rails_helper"

feature "Create comment" do
  let(:user) { create :user, :confirmed }
  let(:article) { create :article }

  before do
    login_as(user, scope: :user)
    visit article_path(article)
  end

  scenario "User submits comment" do
    fill_form(:comment, text: "comment")
    click_button "Create Comment"

    expect(page).to have_content(I18n.t("flash_notices.comment_created"))
  end

  scenario "User submits comment without text" do
    fill_form(:comment, text: "")
    click_button "Create Comment"

    expect(page).to have_content("Text can't be blank")
  end
end

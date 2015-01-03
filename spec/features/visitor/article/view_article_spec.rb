require 'rails_helper'

feature 'View Article' do
  let(:user) { create :user, :confirmed }
  let(:article) { create :article }
  let(:show_page) { Articles::Show.new }

  before do
    login_as(user, scope: :user)
    show_page.load(id: article.id)
  end

  scenario 'User views article' do
    expect(show_page).to have_article_header

    expect(show_page).to have_content(article.text)
  end
end

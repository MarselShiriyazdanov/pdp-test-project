require 'rails_helper'

feature 'Create comment' do
  let(:user) { create :user, :confirmed }
  let(:article) { create :article }
  let(:article_page) { Articles::Show.new }

  before do
    login_as(user, scope: :user)
    article_page.load(id: article.id)
  end

  scenario 'User submits comment' do
    article_page.submit_form('comment')

    expect(article_page).to have_comment_notice
  end

  scenario 'User submits comment without text' do
    article_page.submit_form('')

    expect(article_page).to have_validation_error_alert
  end
end

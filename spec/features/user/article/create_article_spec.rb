require 'rails_helper'

feature 'Create Article' do
  let(:user) { create :user, :confirmed }
  let(:new_page) { Articles::New.new }
  let(:title) { '123' }
  let(:text) { '333' }

  before do
    login_as(user, scope: :user)
    new_page.load
  end

  scenario 'User successfully submits new article' do
    new_page.submit_form(title, text)

    expect(new_page).to have_flash_notice(text: I18n.t('flash_notices.article_created'))
  end

  scenario 'User submits article without necessary attribute' do
    new_page.submit_form(title)

    expect(new_page).to have_validation_error_alert
  end
end

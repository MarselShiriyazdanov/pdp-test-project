require 'rails_helper'

feature 'Edit Article' do
  let(:user) { create :user, :confirmed }
  let(:edit_page) { Articles::Edit.new }
  let(:article) { create :article }

  before do
    login_as(user, scope: :user)
    edit_page.load(id: article.id)
  end

  scenario 'User successfully updates article' do
    edit_page.submit_form('1', '2')

    expect(edit_page).to have_flash_notice(text: I18n.t('flash_notices.article_updated'))
  end

  scenario 'User submits article without necessary attributes' do
    edit_page.submit_form('')

    expect(edit_page).to have_validation_error_alert
  end
end

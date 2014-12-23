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
    expect { edit_page.submit_form('1', '2') }.to change { article.reload.title }
  end

  scenario 'User submits article without necessary attributes' do
    expect { edit_page.submit_form('') }.not_to change { article.reload.title }
  end
end

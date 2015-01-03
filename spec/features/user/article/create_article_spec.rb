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
    expect { new_page.submit_form(title, text) }.to change { Article.count }.by(1)
  end

  scenario 'User submits article without necessary attribute' do
    expect { new_page.submit_form(title) }.not_to change { Article.count }
  end
end

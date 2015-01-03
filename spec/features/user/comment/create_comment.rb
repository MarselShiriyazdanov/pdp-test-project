require 'rails_helper'

feature 'Create comment' do
  let(:user) { create :user, :confirmed }
  let(:article) { create :article }
  let(:new_comment_page) { Comments::New.new }

  before do
    login_as(user, scope: :user)
    new_comment_page.load(id: article.id)
  end

  scenario 'User submits comment' do
    expect { new_comment_page.submit_form('comment') }.to change { Comment.count }

    expect(new_comment_page.current_url).to eq(article_url(article))
  end

  scenario 'User submits comment without text' do
    expect { new_comment_page.submit_form('') }.not_to change { Comment.count }
  end
end

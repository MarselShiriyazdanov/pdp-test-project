class ArticlesController < ApplicationController
  before_action :check_rights, only: %i(new create edit update)

  respond_to(:html)
  expose(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }

  def create
    article.user = current_user
    flash[:notice] = t('flash_notices.article_created') if article.save
    respond_with(article)
  end

  def update
    flash[:notice] = t('flash_notices.article_updated') if article.save
    respond_with(article)
  end

  private

  def article_params
    params.require(:article).permit(:text, :title)
  end

  def check_rights
    authenticate_user!
    render status: :forbidden, text: t('forbidden_page.text') unless current_user.admin?
  end
end

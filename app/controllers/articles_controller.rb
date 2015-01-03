class ArticlesController < ApplicationController
  respond_to(:html)
  expose(:article, attributes: :article_params)

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
end

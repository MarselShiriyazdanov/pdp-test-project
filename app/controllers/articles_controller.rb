class ArticlesController < ApplicationController
  before_action :authorize_user!, only: %i(new create edit update)

  respond_to(:html)
  expose(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }

  def create
    article.user = current_user
    flash[:notice] = t("flash_notices.article_created") if article.save
    respond_with(article)
  end

  def update
    flash[:notice] = t("flash_notices.article_updated") if article.save
    respond_with(article)
  end

  def show
  end

  def index
  end

  def edit
  end

  def new
  end

  private

  def article_params
    params.require(:article).permit(:text, :title)
  end

  def authorize_user!
    authenticate_user!
    authorize(article, :manage?)
  end
end

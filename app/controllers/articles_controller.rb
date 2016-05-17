class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)

  expose(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }

  def create
    article.user = current_user
    article.save
    respond_with(article)
  end

  def update
    authorize article
    article.save
    respond_with(article)
  end

  def show
  end

  def index
  end

  def edit
    authorize article, :update?
  end

  def new
  end

  private

  def article_params
    params.require(:article).permit(:text, :title)
  end
end

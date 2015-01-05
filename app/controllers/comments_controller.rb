class CommentsController < ApplicationController
  before_action :authenticate_user!

  respond_to(:html)
  expose(:article)
  expose(:comments) { article.comments }
  expose(:comment, attributes: :comment_params, ancestor: :comments)

  def create
    comment.user = current_user
    if comment.save
      redirect_to article_path(article), notice: t('flash_notices.comment_created')
    else
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

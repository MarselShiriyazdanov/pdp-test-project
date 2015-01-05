class CommentsController < ApplicationController
  respond_to(:html)
  expose(:article)
  expose(:comments) { article.comments }
  expose(:comment, attributes: :comment_params, ancestor: :comments)

  def create
    comment.user = current_user
    flash[:notice] = t('flash_notices.comment_created') if comment.save
    respond_with(comment, location: article_path(article))
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

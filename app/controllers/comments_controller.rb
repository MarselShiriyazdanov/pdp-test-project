class CommentsController < ApplicationController
  expose(:article)
  expose(:comments) { article.comments }
  expose(:comment, attributes: :comment_params, ancestor: :comments)

  def create
    comment.user = current_user
    if comment.save
      redirect_to article_path(comment.article)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

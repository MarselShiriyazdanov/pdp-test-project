class ArticlePolicy < ApplicationPolicy
  def update?
    user && user.id == record.user_id
  end
end

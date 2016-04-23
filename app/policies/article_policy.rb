class ArticlePolicy < ApplicationPolicy
  def manage?
    user && user.admin?
  end
end

class ArticlePolicy < ApplicationPolicy
  def manage?
    user.admin?
  end
end

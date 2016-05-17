class DashboardController < ApplicationController
  expose(:articles) { Article.order(id: :desc).page(params[:page]).per(10) }

  def index
  end
end

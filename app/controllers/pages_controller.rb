class PagesController < ApplicationController
  expose(:articles) { Article.order(id: :desc).page(params[:page]).per(10) }

  def index
  end

  def about_us
  end
end

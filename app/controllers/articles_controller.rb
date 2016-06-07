class ArticlesController < ApplicationController
  def index
	  @articles = Article.page(params[:page]).per(10).order(publish: :DESC)
  end
end

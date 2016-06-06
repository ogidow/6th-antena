class ArticlesController < ApplicationController
  def index
	  @articles = Article.page(pram[:page]).per(10).order(publish: :DESC)
  end
end

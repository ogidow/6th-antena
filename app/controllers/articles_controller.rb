class ArticlesController < ApplicationController
  def index
	  @articles = Article.order(publish: :DESC)
  end
end

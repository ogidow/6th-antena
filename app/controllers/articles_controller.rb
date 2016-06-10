class ArticlesController < ApplicationController
  def index
	  @articles = Article.page(params[:page]).per(10).order(publish: :DESC)
	  @articles.map do |article|
		article.description = Sanitize.clean(article.description)
		article
	  end

  end
end

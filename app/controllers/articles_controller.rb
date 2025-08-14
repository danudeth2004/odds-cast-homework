class ArticlesController < ApplicationController
  # GET /articles or /articles.json
  def index
    @published_articles = Article.where(status: "published")
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params.expect(:id))
  end
end

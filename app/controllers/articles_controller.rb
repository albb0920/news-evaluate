class ArticlesController < ApplicationController
  load_resource

  def index
    @articles = Article.all
  end

  def show
  end
end

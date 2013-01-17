class ArticlesController < ApplicationController
  load_resource
  before_filter :load_review

  def index
    @articles = Article.all
  end

  def show
    @review = Review.find_or_initialize_by_user_id_and_article_id(current_or_guest_user.id, @article.id)
  end

  def toggle_title_issue
  end

end

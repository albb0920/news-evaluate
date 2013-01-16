class ReviewsController < ApplicationController
  load_resource :article
  before_filter :load_review

  def toggle_title_issue
    @review.toggle_title_issue params[:issue]
    @review.save
    respond_to do |format|
      format.js { render text: '' }
    end
  end

  def score
    if params[:rank] == 'good'
      @review.update_attributes(score: 1)
    elsif params[:rank] == 'bad'
      @review.update_attributes(score: -1)
    end
  end

  def load_review
    @review = Review.find_or_initialize_by_user_id_and_article_id(current_or_guest_user.id, @article.id)
  end
end

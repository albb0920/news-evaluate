class ReviewsController < ApplicationController
  load_resource :article

  def toggle_title_issue
    review = Review.find_or_initialize_by_user_id_and_article_id(current_or_guest_user.id, @article.id)
    review.toggle_title_issue params[:issue]
    review.save
    respond_to do |format|
      format.js { render text: '' }
    end
  end
end

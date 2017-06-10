class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user

    if @review.save
      redirect_to @review.product
    else
      redirect_to @review.product
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end

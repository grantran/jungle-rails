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

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    @product = Product.find params[:product_id]
    redirect_to [@product], notice: 'Review deleted'
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end

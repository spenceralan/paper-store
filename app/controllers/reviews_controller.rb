class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(
      user_id: current_user.id,
      content: review_params.fetch(:content),
      rating: review_params.fetch(:rating)
    )
    if @review.save
      flash[:notice] = "The review has been added."
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    product = Product.find(params[:product_id])
    Review.find(params[:id]).destroy
    flash[:notice] = "The review was sucessfully deleted."
    redirect_to product_path(product)
  end

private
  def review_params
    params.require(:review).permit(:username, :content, :rating)
  end

end
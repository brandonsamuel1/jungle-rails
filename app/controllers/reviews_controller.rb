class ReviewsController < ApplicationController
 before_filter :authorize

 def create
   @product = Product.find(params[:product_id])
   review = @product.reviews.new(review_params)
   review.user_id = current_user.id if current_user

   if review.save!
     redirect_to product_path(params[:product_id])
   else
     redirect_to :back
   end

 end

 def destroy
   @delete_review = Review.find(params[:id]).destroy
   flash[:success] = “Review deleted succcesfully.”
   redirect_to :back
 end

 private
   def review_params
     params.require(:review).permit(:rating, :description)
   end

end

class ReviewsController < ApplicationController
	# Need to load the product so that we can use @product as a model
	before_filter :load_product

	# Ensure user is logged in before creating or destroying reviews
	before_filter :ensure_logged_in, only: [:create, :destroy] 

	def show
		@review = Review.find(params[:id])
	end

	def create
		@review = @product.reviews.build(review_params)
		@review.user = current_user		# This ensures the new review belongs to the current user

		if @review.save
			redirect_to products_path, notice: "Review successfully created"
		else
			render 'products/show'
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
	end

	private
	def review_params
		params.require(:review).permit(:comment, :product_id)
	end

	def load_product
		@product = Product.find(params[:product_id])
	end
end

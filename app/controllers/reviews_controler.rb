class ReviewsController < ApplicationController
before_action :authenticate_user!


  def new
    @review = Review.new
  end


  def create
    @meals = Meal.find(params[:meals_id])
    @review = @meals.reviews.build(review_params)
    @review.user = current_user

      if @review.save
        flash[:notice] = "You're review has been saved."
        redirect_to @meals
      else
        flash[:alert] = "An error occured saving your review."
        render :new
      end
  end


private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

end

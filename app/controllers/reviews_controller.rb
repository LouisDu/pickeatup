class ReviewsController < ApplicationController

  def create
    @meal = Meal.find(params[:meal_id])
    @review = @meal.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "Votre avis est enregistré."
      redirect_to @meal
    else
      flash[:alert] = "Une erreur est parvenue."
      render 'meals/show'
    end
  end

private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

end

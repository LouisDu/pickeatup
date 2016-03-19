class ReviewsController < ApplicationController

  def index
    @meal = Meal.find(params[:meal_id])
    @reviews = policy_scope(Review)
    @review = Review.new
  end

# Faire une methode pour calculer la note moyenne. Ensuite tu removes le button "review"
# pour afficher la note qui est linkee jusqu'aux summarize comment.
# PLes review + le form doivent s afficher.
#
  def create
    @meal = Meal.find(params[:meal_id])
    @review = @meal.reviews.build(review_params)
    @review.user = current_user
    authorize @review

    if @review.save
      flash[:notice] = "Votre avis est enregistré."
      redirect_to @meal
    else
      flash[:alert] = "Une erreur est parvenue."
      render 'meals/show'
    end
  end

  # def average_rating
  # @reviews = self.reviews
  # @review_sum = reviews.inject(0) { |sum, review| sum += review.rating }
  # avg_rating = (review_sum / reviews.count).to_i unless review_sum == 0
  # end


private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

end

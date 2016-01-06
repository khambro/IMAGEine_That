class ReviewsController <ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to "/browse"
  end

  def new
    @reviews = Review.all
    @review = Review.new
  end


  def show
    @review = Review.new
    @reviews = Review.all
  end

  def all
    @reviews = Review.all
  end




 private

  def review_params
    params.require(:review).permit(:photo_id, :user_id, :rating, :comment)
  end




end

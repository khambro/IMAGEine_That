class ReviewsController <ApplicationController

  def send_subscribe
    PhotoMailer.subscribe(current_user.id).deliver_now
    redirect_to "/browse"
  end


  def create
    @review = Review.new(review_params)
    @review.save
    PhotoMailer.review_received(@review.id).deliver_now
    redirect_to "/browse"
  end

  def new
    @reviews = Review.all
    @review = Review.new
  end


  def show
    @photo = Photo.find(params[:id]) 
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

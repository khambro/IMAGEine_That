class PhotosController <ApplicationController

  def send_subscribe
    PhotoMailer.subscribe(current_user.id).deliver_now
    redirect_to "/browse"
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    @photo.rank = 0
    @photo.save
    redirect_to "/photo/#{@photo.id}"
  end

  def new
    @photos = Photo.all
    @photo = Photo.new
  end


  def show

    @photos = Photo.where(user_id: current_user.id)
  end

  def all
    @photos = Photo.all.where.not(user_id: current_user.id)
    @random = []
    @photos.each do |s|
      if !s.reviews.exists?(user_id: current_user.id)
        @random << s
      end
    end
    @random = @random.sample
  end

  def sorted
    @photos = Photo.all
    @reviews = Review.all

  end

  



  def delete
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect_to "/user-homepage"
end




 private

  def photo_params
    params.require(:photo).permit(:image_file, :user_id, :description, :rank)
  end




end

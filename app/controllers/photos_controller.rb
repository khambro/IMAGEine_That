class PhotosController <ApplicationController

  def send_subscribe
    PhotoMailer.subscribe(current_user.id).deliver_now
    redirect_to "/browse"
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to "/user-homepage"
  end

  def new
    @photos = Photo.all
    @photo = Photo.new
  end


  def show
    @photo = Photo.new
    @photos = Photo.all
  end

  def all
    @photos = Photo.all
  end

  def delete
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect_to "/user-homepage"
end




 private

  def photo_params
    params.require(:photo).permit(:image_file, :user_id, :description)
  end




end

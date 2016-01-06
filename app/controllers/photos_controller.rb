class PhotosController <ApplicationController

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




 private

  def photo_params
    params.require(:photo).permit(:image_file, :user_id, :description)
  end




end

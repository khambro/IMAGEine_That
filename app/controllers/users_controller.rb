class UsersController <ApplicationController

  def index
    current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/user-homepage"
    else
      redirect_to "/user/new", notice: "Username or email not complete, or passwords do not match. You tell me!"
    end
  end

  def new
    @users = User.all
  end

  def show
    @current_user = User.find(session[:user_id])
  end

  def edit
    @current_user = User.find(session[:user_id])
  end

  def update
    @current_user = User.find(session[:user_id])
  end

  def user_collection
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: @user.id)

  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

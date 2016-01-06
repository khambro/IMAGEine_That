class UsersController <ApplicationController

  def index
    current_user
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to "/user-homepage"
  end

  def new
    @users = User.all
  end

  def show
    @current_user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end

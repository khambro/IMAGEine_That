class SessionsController < ApplicationController

  def sign_out
    session.delete(:user_id)
    session.delete(:id)
    redirect_to "/"
  end

  def sign_in
    @user = User.find_by(email: params[:email])
      if @user
        @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to "/user-homepage", notice: "You have been signed in #{@user.email}!"
      else
        redirect_to "/", notice: "Wrong username/password. Try again."
      end
  end


end

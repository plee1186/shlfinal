class SessionsControllerController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "#{user.user_name} successfully logged in!"
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end
  
  
  def destroy
    log_out
    flash[:success] = "User successfully logged out"
    redirect_to users_url
  end
  
  
end

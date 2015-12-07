class Api::V1::SessionsController < Api::V1::BaseController
  
  def create
    user = User.find_by(user_name: create_params[:user_name])
    if user && user.authenticate(create_params[:password])
      self.current_user = user
      render json: user, root: false, status: 201
    else
      return api_error(status: 401)
    end
  end

  private
  
  def create_params
    params.require(:user).permit(:user_name, :password)
  end
end
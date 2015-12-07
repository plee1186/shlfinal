class Api::V1::BaseController < ApplicationController
  include Pundit
  before_action :destroy_session
  
  attr_accessor :current_user

  protected
  
  def destroy_session
    request.session_options[:skip] = true
  end
  
  def unauthenticated!
    response.headers['WWW-Authenticate'] = "Token realm=Application"
    render json: { error: 'Unauthenticated' }, status: 401
  end
  
  def unauthorized!
    render json: { error: 'Unauthorized' }, status: 403
  end
    
  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    user_name = options.blank?? nil : options[:user_name]
    user = user_name && User.find_by(user_name: user_name)
    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
      @current_user = user
    else
      return unauthenticated!
    end
  end
end
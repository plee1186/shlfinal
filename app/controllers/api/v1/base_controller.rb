class Api::V1::BaseController < ApplicationController
  #protect_from_forgery with :null_session
  include Pundit
  before_action :destroy_session

  def not_found
    return api_error(status: 404, errors: 'Not found')
  end
  
  attr_accessor :current_user

  protected
  
  def destroy_session
    request.session_options[:skip] = true
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
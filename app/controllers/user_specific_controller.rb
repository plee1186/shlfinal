class UserSpecificController < ApplicationController
  
  def profile
    @user = current_user
    #render json: JSON.pretty_generate(JSON.parse(User.all.to_json()))
    #render json: JSON.pretty_generate(JSON.parse(Challenge.all.to_json()))
  end
  
  #GET list of incomplete challenges
  def add
  end
  
  def create
    @user = current_user
    c_id = params['challenge_ids']
    c_id = c_id.to_s
    @challenge = Challenge.find(c_id)
    render json: JSON.pretty_generate(JSON.parse(@challenge.to_json()))
    
  end

end


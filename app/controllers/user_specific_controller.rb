class UserSpecificController < ApplicationController
  
  def profile
    @user = current_user
  end
  
  #GET list of incomplete challenges
  def add
  end
  
  def create
    @user = current_user
    c_id = params['challenge_ids']
    c_id = c_id.to_s
    @challenge = Challenge.find(c_id)
    #render json: JSON.pretty_generate(JSON.parse(@challenge.to_json()))
    
    if @user.push(challenge_ids: @challenge.id)
      flash[:success] = "#{@challenge.name} successfully completed!"
      redirect_to profile_path
    else
      flash[:danger] = "Something went wrong"
      redirect_to profile_path
    end
  end

end


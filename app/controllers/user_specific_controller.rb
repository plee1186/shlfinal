class UserSpecificController < ApplicationController
  
  def profile
    @user = current_user
    @shoutouts = Shoutout.all
  end
  
  #GET list of incomplete challenges
  def add
  end
  
  def create
    @user = current_user
    c_id = params['challenge_ids']
    c_id = c_id.to_s
    @challenge = Challenge.find(c_id)
    
    if @user.push(challenge_ids: @challenge.id) and @challenge.push(user_ids: @user.id)
      flash[:success] = "#{@challenge.name} successfully completed!"
      redirect_to profile_path
    else
      flash[:danger] = "Something went wrong"
      redirect_to profile_path
    end
  end

end


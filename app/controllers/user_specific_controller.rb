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
  
  
  #shoutout logic
  def newshout
    @shoutout = Shoutout.new
  end

  # POST /shoutouts
  # POST /shoutouts.json
  def createshout
    @shoutout = Shoutout.new
    @shoutout = current_user.shoutouts.build(shoutout_params)
    if @shoutout.save
      flash[:success] = "Made a shoutout created!"
      redirect_to profile_path(current_user)
    else
      flash[:danger] = "Whoops something went wrong"
      redirect_to profile_path(current_user)
    end
  end
  
  # DELETE /shoutouts/1
  # DELETE /shoutouts/1.json
  def destroyshout
    @shoutout.destroy
    redirect_to profile_path(current_user)
  end
  
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def shoutout_params
    params.require(:shoutout).permit(:content)
  end

end


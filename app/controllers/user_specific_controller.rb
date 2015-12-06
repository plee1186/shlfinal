class UserSpecificController < ApplicationController

  def list
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
    
#     if @user.push(challenge_ids: @challenge.id)
#       respond_to do |format|
#         format.html { redirect_to user_specific_list_path, notice: "#{@challenge.name} completed. Congrats!" }
#       end
#     else
#       respond_to do |format|
#       format.html { redirect_to user_specific_add_path, notice: "Something went wrong. Please try again" }
#      end
#     end
  end
end


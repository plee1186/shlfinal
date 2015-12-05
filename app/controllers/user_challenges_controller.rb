class UserChallengesController < ApplicationController
  def home
    @user = current_user
    @challenges = Challenge.all
  end
end

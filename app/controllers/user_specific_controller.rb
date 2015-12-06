class UserSpecificController < ApplicationController
  def list
    @user = current_user
  end

  def add
    @user = current_user
    @challenges = Challenge.all
  end
end

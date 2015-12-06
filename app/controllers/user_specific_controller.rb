class UserSpecificController < ApplicationController
  def list
    @user = current_user
  end

  def add
  end
end

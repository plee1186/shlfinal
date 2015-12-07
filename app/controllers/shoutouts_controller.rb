class ShoutoutsController < ApplicationController
  
  # GET /shoutouts
  # GET /shoutouts.json
  def index
    @shoutouts = Shoutout.all
  end
end

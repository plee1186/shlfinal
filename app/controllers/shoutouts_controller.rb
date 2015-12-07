class ShoutoutsController < ApplicationController
  before_action :set_shoutout, only: [:show, :edit, :update, :destroy]

  # GET /shoutouts
  # GET /shoutouts.json
  def index
    #@shoutouts = Shoutout.all
    @shoutouts = Shoutout.order_by(:created_at => 'desc')
  end

  # GET /shoutouts/1
  # GET /shoutouts/1.json
  def show
  end

  # GET /shoutouts/new
  def new
  end

  # POST /shoutouts
  # POST /shoutouts.json
  def create
    @shoutout = Shoutout.new(shoutout_params)
    @user = current_user
    
    if @user.push(shoutout_ids: @shoutout.id)
      flash[:success] = "Shoutout at #{@shoutout.created_at} successfully created!"
      redirect_to profile_path
    else
      flash[:danger] = "Something went wrong"
      redirect_to profile_path
    end
    # respond_to do |format|
    #   if @shoutout.save
    #     format.html { redirect_to @shoutout, notice: 'Shoutout was successfully created.' }
    #     format.json { render :show, status: :created, location: @shoutout }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @shoutout.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /shoutouts/1
  # PATCH/PUT /shoutouts/1.json
  def update
  end

  # DELETE /shoutouts/1
  # DELETE /shoutouts/1.json
  def destroy
    @shoutout.destroy
    respond_to do |format|
      format.html { redirect_to shoutouts_url, notice: 'Shoutout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoutout
      @shoutout = Shoutout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoutout_params
      params.require(:shoutout).permit(:content)
    end
end

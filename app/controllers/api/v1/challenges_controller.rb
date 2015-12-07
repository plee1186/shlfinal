class Api::V1::ChallengesController < ApplicationController
    protect_from_forgery with: :null_session
    
    #/api/v1/challenges (GET all challenges) //
    def index
        @challenges = Challenges.all
        render json: JSON.pretty_generate(JSON.parse(@challenges.to_json()))
    end
    
    #/api/v1/users/:id (GET user) //
    def show
        @challenge = User.find(params[:id])
        if @challenge.nil?
            render json: { error: "No Challenge with id: #{params[:id]}", status: 400 }, status: 400
        else
            render json: JSON.pretty_generate(JSON.parse(@challenge.to_json()))
        end
    end
    
    ##/api/v1/users(:format) (POST) //
    def create
        @challenge = Challenge.new(challenge_params)
        if @challenge.save
            #respond_to do |format|
            render json: JSON.pretty_generate(JSON.parse(@challenge.to_json()))
            #format.json { render json: JSON.pretty_generate(JSON.parse(@user.to_json())) }
        else
            render json: { error: "Could not create challege", status: 400 }, status: 400
        end
    end
    
    #/api/v1/users/:id (DELETE) //
    def destroy
        if Challenge.find(params[:id]).nil?
            #format.json { redirect_to api_v1_users_path, notice: "User with id #{params[:id]} cannot be found" }
            render json: { error: "No Challenge with id: #{params[:id]}", status: 400 }, status: 400
        else
            @challenge = Challenge.find(params[:id])
            if @challenge.destroy
                render json: { success: "User deleted", status: 200 }, status: 200
            end
        end
    end
    
    #api/v1/users/:id(.:format) (PUT) //
    def update
        if Challenge.find(params[:id]).nil?
            render json: { error: "No Challenge with id: #{params[:id]}", status: 400 }, status: 400
        else
            @challenge = Challenge.find(params[:id])
            @challenge.update(challenge_params)
            respond_to do |format|
                format.json { render json: JSON.pretty_generate(JSON.parse(@user.to_json())) }
            end
        end
    end
    
    private
    
    def challenge_params
        params.require(:challenge).permit(:name, :description, :difficulty, :restaurant, :address, :city, :state, :zip)
    end
end

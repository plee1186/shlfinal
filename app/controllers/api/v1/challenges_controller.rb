class Api::V1::ChallengesController < Api::V1::BaseController
    ##This controller is not for others to use. I would put an admin role
    ##on the user so they can add into the challenges database
    before_action :authenticate_user!
   
   
    #/api/v1/challenges (GET all challenges) //
    def index
        @challenges = Challenge.all
        render json: @challenges
    end
    
    #get a list of challenges the user completed completed yet //
    def show
        @challenges = Challenge.where(user_ids: params[:id])
        @challenges = policy_scope(@challenge)
                
        render json: @challenge
    end
    
    ##add a challenge the user completed POST
    def create
        @challenge = Challenge.new(challenge_params)
        if @challenge.save
            render json: @challenge
        else
            render json: { error: "Application error", status: 400 }, status: 400
        end
    end
    
    # #/api/v1/challenge/:id (DELETE) //
    # def destroy
    #     if Challenge.find(params[:id]).nil?
    #         render json: { error: "Application error", status: 400 }, status: 400
    #     else
    #         @challenge = Challenge.find(params[:id])
    #         if @challenge.destroy
    #             head status: 204
    #         end
    #     end
    # end
    
    # #api/v1/challenge/:id(.:format) (PUT) //
    # def update
    #     if Challenge.find(params[:id]).nil?
    #         render json: { error: "Application error", status: 400 }, status: 400
    #     else
    #         @challenge = Challenge.find(params[:id])
    #         if @challenge.update(challenge_params)
    #             render json: @challenge, status: 200, location: api_v1_challenge_path(@challenge.id)
    #         else
    #             render json: { error: "Server error", status: 500 }, status: 500
    #         end
    #     end
    # end
    
    private
    
    def challenge_params
        params.require(:challenge).permit(:name, :description, :difficulty, :restaurant, :address, :city, :state, :zip, :user_ids)
    end
end

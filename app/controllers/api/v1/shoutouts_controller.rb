class Api::V1::ShoutoutsController < Api::V1::BaseController
    before_action :authenticate_user!
    
    #get all user's shoutouts
    def index
        shoutouts = Shoutout.where(user_ids: params[:id])
        shoutouts = policy_scope(shoutouts)
        render json: shoutouts
    end
    
    #get a specific shoutouts //
    def show
        shoutout = Shoutout.find(params[:id])
        authorize shoutout
        render json: shoutout
    end
    
    #create a new shoutout
    def create
        @shoutout = Shoutout.new(create_params)
        if @shoutout.save
            render json: @shoutout, status: 201, location: api_v1_shoutout_path(@shoutout.id)
        else
            render json: { error: "Application error", status: 400 }, status: 400
        end
    end
    
    #/api/v1/users/:id (DELETE) //
    def destroy
        shoutout = Shoutout.find(params[:id])
        authorize shoutout
        
        if shoutout.destroy
            head status: 204
        else
            render json: { error: "Server error", status: 500 }, status: 500
        end
    end
    
    private
    
    def create_params
        params.require(:shoutout).permit(:content, :user_ids)
    end
end

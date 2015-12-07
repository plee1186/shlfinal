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
        shoutout = Shoutout.new(create_params)
        if @user.save
            render json: @user, status: 201, location: api_v1_users_path(@user.id)
        else
            render json: { error: "Application error", status: 400 }, status: 400
        end
    end
    
    #/api/v1/users/:id (DELETE) //
    def destroy
        user = User.find(params[:id])
        authorize user
        
        if user.destroy
            head status: 204
        else
            render json: { error: "Server error", status: 500 }, status: 500
        end
    end
    
    private
    
    def update_params
        create_params
    end
    
    def create_params
        params.require(:shoutout).permit(:content, :user_ids)
    end
end

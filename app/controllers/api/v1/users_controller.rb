class Api::V1::UsersController < Api::V1::BaseController
    before_filter :authenticate_user!, only: [:show, :update, :destroy]
    
    #/api/v1/users (GET all users) //
    def index
        users = User.all
        users = policy_scope(users)
        
        render json: users
    end
    
    #/api/v1/users/:id (GET user) //
    def show
        @user = User.find(params[:id])
        authorize @user
        render json: @user
    end
    
    ##/api/v1/users(:format) (POST) //
    def create
        @user = User.create(create_params)
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
    
    #api/v1/users/:id(.:format) (PUT) //
    def update
        user = User.find(params[:id])
        authorize user
        if user.update(update_params)
            render json: user, status: 200, location: api_v1_user_path(user.id)
        else
            render json: { error: "Application error", status: 422 }, status: 422
        end
    end
    
    private
    
    def update_params
        create_params
    end
    
    def create_params
        params.require(:user).permit(:user_name, :password, :password_confirmation).delete_if{ |k,v| v.nil? }
    end
end

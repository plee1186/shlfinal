class Api::V1::UsersController < ApplicationController
    #Api::V1::BaseController
    protect_from_forgery with: :null_session
    
    #/api/v1/users (GET all users) //
    def index
        @users = User.all
        render json: JSON.pretty_generate(JSON.parse(@users.to_json()))
    end
    
    #/api/v1/users/:id (GET user) //
    def show
        @user = User.find(params[:id])
        if @user.nil?
            render text: "User with id #{params[:id]} cannot be found"
        else
            render json: JSON.pretty_generate(JSON.parse(@user.to_json()))
        end
    end
    
    ##/api/v1/users(:format) (POST) //
    def create
        @user = User.create(user_name: params[:user_name], password: params[:password], password_confirmation: params[:password_confirmation])
        if @user.save
            respond_to do |format|
                format.json { render json: JSON.pretty_generate(JSON.parse(@user.to_json())) }
            end
        else
            format.json { redirect_to api_v1_users_path, notice: "User could not be created" }
        end
    end
    
    #/api/v1/users/:id (DELETE) //
    def destroy
        if User.find(params[:id]).nil?
            #format.json { redirect_to api_v1_users_path, notice: "User with id #{params[:id]} cannot be found" }
            render text: "User with id #{params[:id]} cannot be found"
        else
            @user = User.find(params[:id])
            @user.destroy
            render text: "User with id #{params[:id]} deleted"
        end
    end
    
    #api/v1/users/:id(.:format) (PUT) //
    def update
        if User.find(params[:id]).nil?
            #render :status => 404, :json => {:status => "error", :errorcode => "11009", :message => "Invalid userid."}
            render text: "User with id #{params[:id]} cannot be found"
        else
            @user = User.find(params[:id])
            @user.update(email: params[:email], gender: params[:gender], fname: params[:fname], lname: params[:lname], yob: params[:yob], tos: params[:tos])
            respond_to do |format|
                format.json { render json: JSON.pretty_generate(JSON.parse(@user.to_json())) }
            end
        end
    end
end

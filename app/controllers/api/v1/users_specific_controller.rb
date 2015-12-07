class Api::V1::UsersSpecificController < Api::V1::BaseController
    before_filter :authenticate_user!, only: [:show, :update, :destroy]
    
end
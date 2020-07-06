class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create #WORKS
        new_user = User.new(user_params)
        new_user.save
        render json: new_user
    end


    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :bio, :zip, :email, :avatar, :password_digest)
    end

end

class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create #WORKS
        new_user = User.new(user_params)
        new_user.password = params[:password_digest]
        new_user.save
        render json: new_user
    end

    def my_direct_messages
        user = User.find(params[:id])
        all_mesgs = user.messages + Message.all.select{|m| m.friend == user}
        render json: all_mesgs.to_json(include: [{user: {only: [:username, :first_name]}}, {friend: {only: [:username, :first_name]}}])
    end


    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :bio, :zip, :email, :avatar )
    end

end

class Api::V1::AuthController < ApplicationController
      #skip_before_action :authorized, only: [:create]
    def create # auth#login
    #
    #     # @user = User.find_by(username: user_login_params[:username])
    #
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), token: token }
        else
            render json: { error: true, message: 'Invalid username or password' }
        end
    end

    def jwt_log_in
        token = decode_token(request.headers["Authentication"])
        user_id = token["user_id"]
        user = User.find(user_id)
        render json: user
    end



    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end
end

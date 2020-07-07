class MessagesController < ApplicationController

    def search
        x = Message.find_by(user_id: params[:w], friend_id: params[:z])
        y = Message.find_by(user_id: params[:z], friend_id: params[:w])
        if x
            show(x.id)
        elsif y
            show(y.id)
        else
            render json: {mesg: "CREATE NEW!"}
        end
    end

    def show(id=nil)
        if id
            render json: Message.find(id).to_json(include: [{user: {only: [:username, :bio, :avatar]}}, {friend: {only: [:username, :bio, :avatar]}},:remarks])
        else
            render json: specific_message.to_json(include: [{user: {only: [:username, :bio, :avatar]}}, {friend: {only: [:username, :bio, :avatar]}},:remarks])
        end
    end

    def create

    end


    private

    def specific_message
        Message.find(params[:id])
    end


end

class MessagesController < ApplicationController

    def create
        mesg = Message.create(user_id: params[:first_person], friend_id: params[:second_person])
        show(mesg.id)
    end


    def search
        x = Message.find_by(user_id: params[:first_person], friend_id: params[:second_person])
        y = Message.find_by(user_id: params[:second_person], friend_id: params[:first_person])
        if x
            show(x.id)
        elsif y
            show(y.id)
        else
            create()
        end
    end

    def show(id=nil)
        if id #traditional show method. GET "/messages/:id"
            render json: Message.find(id).to_json(include: [{user: {only: [:username, :bio, :avatar]}}, {friend: {only: [:username, :bio, :avatar]}},:remarks])
        else #if i don't know the
            render json: specific_message.to_json(include: [{user: {only: [:username, :bio, :avatar]}}, {friend: {only: [:username, :bio, :avatar]}},:remarks])
        end
    end

    private

    def message_params
        params.require(:message).permit(:user_id, :friend_id)
    end

    def specific_message
        Message.find(params[:id])
    end


end

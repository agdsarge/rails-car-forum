class PostsController < ApplicationController
    def index
        render json: Post.all.to_json(include: {user: {only: [:username, :bio] }})
    end
end

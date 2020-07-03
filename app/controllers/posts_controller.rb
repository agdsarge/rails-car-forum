class PostsController < ApplicationController
    def index
        posts = Post.all
        sorted_posts = posts.sort {|a,b| b.updated_at <=> a.updated_at}
        render json: sorted_posts.to_json(include: {user: {only: [:username, :bio, :avatar] }})
    end

    def show
        render json: Post.find(params[:id]).to_json(include: [{user: {only: [:username, :bio, :avatar] }}, {comments: {include: {user: {only: [:username, :bio, :avatar] }}}}])
    end

end

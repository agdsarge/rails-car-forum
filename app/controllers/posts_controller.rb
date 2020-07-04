class PostsController < ApplicationController
    def index
        posts = Post.all
        sorted_posts = posts.sort {|a,b| b.updated_at <=> a.updated_at}
        render json: sorted_posts.to_json(include: {user: {only: [:username, :bio, :avatar] }})
    end

    def show
        render json: specific_post.to_json(include: [{user: {only: [:username, :bio, :avatar] }}, {comments: {include: {user: {only: [:username, :bio, :avatar] }}}}])
    end

    def create #WORKS
        new_post = Post.new(post_params)
        new_post.save
        render json: new_post
    end

    def update #WORKS
        specific_post.update(post_params)
        render json: {message: "Post edited and saved."}
    end

    def destroy #WORKS
        specific_post.destroy
        index()
    end

    private

    def specific_post
        Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:body, :subject, :user_id, :picture)
    end

end

# fetch("http://localhost:3000/posts", {
#     method: 'POST',
#     headers: {
#         "Content-Type": "application/json",
#         "Accept": "application/json"
#     },
#     body: JSON.stringify({subject: "this is a new car. test post.", body: "what a wondrous vehicle", picture: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Wienermobile_OURDOG_plate.jpg/1024px-Wienermobile_OURDOG_plate.jpg", user_id: 4})
#     }).then(r => r.json()).then(console.log)

    # fetch("http://localhost:3000/posts/4", {
    #     method: 'PUT',
    #     headers: {
    #         "Content-Type": "application/json",
    #         "Accept": "application/json"
    #     },
    #     body: JSON.stringify({subject: "this is a new car. test post.", body: "[EDITED]", picture: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Wienermobile_OURDOG_plate.jpg/1024px-Wienermobile_OURDOG_plate.jpg", user_id: 4})
    #     #     })
    #     }).then(r => r.json()).then(console.log)

class CommentsController < ApplicationController
    def index
        render json: Comment.all
    end

    def create
        new_comment = Comment.new(comment_params)
        new_comment.save
        render json: new_comment
    end

    private


    def comment_params
        params.require(:comment).permit(:body, :post_id, :user_id, :picture)
    end
end

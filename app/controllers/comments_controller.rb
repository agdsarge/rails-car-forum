class CommentsController < ApplicationController
    def index #not sure if needed
        render json: Comment.all
    end

    def show #not sure if needed
        render json: specific_comment
    end

    def create
        new_comment = Comment.new(comment_params)
        new_comment.save
        render json: new_comment
    end

    def update
        specific_comment.update(comment_params)
        render json: {message: "Post edited and saved."}
    end


    def destroy
        render json: specific_comment.destroy
    end

    private

    def specific_comment
        Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:body, :post_id, :user_id, :picture)
    end
end

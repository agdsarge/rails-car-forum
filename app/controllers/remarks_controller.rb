class RemarksController < ApplicationController

    def create
        new_remark = Remark.create(remark_params)
        render json: new_remark
    end

    private

    def comment_params
        params.require(:remark).permit(:body, :message_id, :user_id, :picture)
    end


end

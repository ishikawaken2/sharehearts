class LikesController < ApplicationController
    def create
        like = current_user.likes.create(talk_id: params[:talk_id], answer_id: params[:answer_id]) # user_idとtalk_idとanswer_idの三つを代入
        redirect_back(fallback_location: root_path)
    end

    def destroy
        like = Like.find_by(talk_id: params[:talk_id] ,answer_id: params[:answer_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
end

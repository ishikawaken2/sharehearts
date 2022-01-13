class LikesController < ApplicationController
before_action :answer_params
    def create
        like = current_user.likes.create(talk_id: params[:talk_id], answer_id: params[:answer_id]) # user_idとtalk_idとanswer_idの三つを代入
    end

    def destroy
        like = Like.find_by(talk_id: params[:talk_id] ,answer_id: params[:answer_id], user_id: current_user.id)
        like.destroy
    end

    private
    
    def answer_params
        @answer = Answer.find(params[:id])
    end
end

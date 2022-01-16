class AnswersController < ApplicationController
    before_action :authenticate_user!
    def create  
        talk = Talk.find(params[:talk_id])
        answer = talk.answers.build(answer_params)# buildを使い、answerとtalk_idの二つを同時に代入
        answer.user_id = current_user.id
        if answer.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:success] = "コメントできませんでした"   
            redirect_back(fallback_location: root_path)
        end
    end

    def edit
        @answer = Answer.find_by(id: params[:id] talk_id: params[:talk_id] ,answer_id: params[:answer_id])
    end

    def update
        answer = Answer.find_by(id: params[:id] talk_id: params[:talk_id] ,answer_id: params[:answer_id])
        if  answer.update(answer_params)
            redirect_to :action =>"show", :id => talk.id, :talk_id => talk.id, :answer_id => answer.id
        else
            redirect_to :action =>"new"
        end
    end

    private
    def answer_params
        params.require(:answer).permit(:body)
    end
end

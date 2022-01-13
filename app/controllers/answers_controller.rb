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
    private
    def answer_params
        params.require(:answer).permit(:body)
    end
end

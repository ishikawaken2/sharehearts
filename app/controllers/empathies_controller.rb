class EmpathiesController < ApplicationController
before_action :talk_params
    def create
        empathy = current_user.empathies.create(talk_id: params[:talk_id]) # user_idとtalk_idの二つを代入
    end

    def destroy
        empathy = Empathy.find_by(talk_id: params[:talk_id], user_id: current_user.id)
        empathy.destroy
    end

    private
    
    def talk_params
        @talk = Talk.find(params[:id])
    end
end

class EmpathiesController < ApplicationController
    def create
        empathy = current_user.empathies.create(talk_id: params[:talk_id]) # user_idとtalk_idの二つを代入
        redirect_back(fallback_location: root_path)
    end

    def destroy
        empathy = Empathy.find_by(talk_id: params[:talk_id], user_id: current_user.id)
        empathy.destroy
        redirect_back(fallback_location: root_path)
    end
end

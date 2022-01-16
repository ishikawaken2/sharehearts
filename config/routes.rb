Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :talks do
    resources :empathies, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy ,:edit ,:update] do  
      resources :likes, only: [:create, :destroy]
      # talk_answer_likes POST   /talks/:talk_id/answers/:answer_id/likes(.:format)   
      # talk_answer_like DELETE /talks/:talk_id/answers/:answer_id/likes/:id(.:format)     
    end
  end
  root 'talks#index'
end

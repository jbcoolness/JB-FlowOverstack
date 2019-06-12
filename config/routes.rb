Rails.application.routes.draw do
  resources :questions do
    resources :answers, except: %i[:index] do
    end
  end
  
  root "questions#index"
  
  
  devise_for :users
end

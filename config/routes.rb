Rails.application.routes.draw do
  resources :questions do
    resources :answers, except: %i[:index]
    resources :comments, except: %i[:index]
  end

  resources :answers, except: %i[:index] do
    resources :comments, except: %i[:index]
  end
  
  root "questions#index"
  
  
  devise_for :users
end

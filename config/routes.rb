Rails.application.routes.draw do
  devise_for :users

  resources :home, only: [:index]
  
  resources :products do
    resources :reviews
  end

  root "home#index"
end

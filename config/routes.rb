Rails.application.routes.draw do
  devise_for :users

  get '/user/reviews', to: 'users#reviews', as: 'user_reviews'

  resources :home, only: [:index]
  
  resources :products do
    resources :reviews
  end

  root "home#index"
end

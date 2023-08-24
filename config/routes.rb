Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :bookings, only: [:index]
  end
  resources :ducks do
    resources :bookings, only: %i[create edit update]
  end
  resources :bookings, only: [:destroy]
  resources :favorites, only: %i[new edit]
  resources :favorites, only: [:destroy]
end

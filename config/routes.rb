Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :ducks
  resources :users do
    resources :bookings, only: %i[new edit index]
    resources :favorites, only: %i[new edit]
  end
  resources :bookings, only: [:destroy]
  resources :favorites, only: [:destroy]
end

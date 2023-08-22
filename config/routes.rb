Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :ducks do
    resources :bookings, only: %i[new edit]
    resources :favorites, only: %i[new edit]
  end
  resources :bookings, only: [:destroy]
  resources :favorites, only: [:destroy]
end

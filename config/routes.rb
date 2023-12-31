Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :bookings, only: [:index]
    resources :favorites, only: %i[index]
  end

  resources :ducks do
    collection do
      get :map
      get :myducks
    end
    resources :bookings, only: %i[new create edit update]
  end
  resources :bookings, only: [:destroy]
  resources :favorites, only: [:destroy]
end

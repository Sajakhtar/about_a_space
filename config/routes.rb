Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spaces do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :booking, only: [:show, :destroy]

  get 'my_account', to: 'dashboard#my_account'
end

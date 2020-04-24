Rails.application.routes.draw do
  
  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  resources :tweets
  
  get 'login' => 'sessions#new'
  post 'logout' => 'sessions#destroy'
  root to: 'registrations#new' 
end

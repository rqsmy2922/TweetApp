Rails.application.routes.draw do
  
  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:edit, :update]
  
  resources :users, only: [:index, :show] do
    resource :follows, only: [:create, :destroy] 
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member
  end 
  
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    get :timeline, on: :collection
  end 
  
  get 'login' => 'sessions#new'
  post 'logout' => 'sessions#destroy'
  root to: 'registrations#new' 
end

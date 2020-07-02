Rails.application.routes.draw do
  
  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resources :activates, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users, only: [:edit, :update, :show, :destroy], param: :name do
    member do
      get :unsubscribed
    end
  end
  resources :users, only: [:index] do
    resource :follows, only: [:create, :destroy]
    member do
      get :activate, param: :activation_token
    end
  end
  resources :tweets, only: [:index, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end 
  
  get 'login' => 'sessions#new'
  post 'logout' => 'sessions#destroy'
  root to: 'registrations#new' 
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end

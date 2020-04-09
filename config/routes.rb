Rails.application.routes.draw do
  get 'sessions/new'
  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  root to: 'registrations#new' 
end

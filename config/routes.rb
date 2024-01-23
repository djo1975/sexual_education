Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations' }
  get '/check_authentication', to: 'sessions#check_authentication'
  resources :users, only: [:index, :create]
  resources :questions, only: [:index, :create]
  resources :comments, only: [:index, :create]
  resources :journals, only: [:index, :create]
  resources :feedbacks, only: [:index, :create]
  resources :likes, only: [:index, :create]
end

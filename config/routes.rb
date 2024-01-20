Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :questions, only: [:index, :create]
  resources :comments, only: [:index, :create]
  resources :journals, only: [:index, :create]
  resources :feedbacks, only: [:index, :create]
  resources :likes, only: [:index, :create]
end

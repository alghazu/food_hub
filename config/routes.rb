Rails.application.routes.draw do
  devise_for :users
  resources :recipes do
    post :like, controller: :likes, action: :toggle
  end
  resources :users, only: [:show]
  resources :categories, only: [:show]
  root controller: :recipes, action: :index
end

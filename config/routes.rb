Rails.application.routes.draw do
  devise_for :users
  resources :recipes do
    post 'like', to: 'likes#toggle'
  end
  resources :categories, only: [:show]
  root controller: :recipes, action: :index
end

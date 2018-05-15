Rails.application.routes.draw do
  devise_for :users
  resources :recipes do
    post 'like', to: 'recipes#upvote'
  end
  root controller: :recipes, action: :index
end

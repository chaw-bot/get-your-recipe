Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index]
  resources :foods, only: %i[index new create destroy]

  resources :recipes, only: %i[index new show create destroy] do
    resources :recipe_foods, only: %i[new create show destroy]
  end
  resources :recipe_foods, only: %i[new new create destroy]
  resources :public_recipes, only: %i[index]
  resources :general_shopping_lists, only: %i[index]

  root to: 'users#index'
end

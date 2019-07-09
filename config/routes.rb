Rails.application.routes.draw do
  get 'recipes/search', to: 'recipes#search', as: "search"
  post 'search', to: 'recipes#search_results'
  resources :ingredients
  resources :recipes
  resources :favorites
  resources :likes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

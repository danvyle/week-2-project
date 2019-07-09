Rails.application.routes.draw do
  # get 'recipes/search', to: 'recipes#search', as: "search"
  # post 'search', to: 'recipes#search_results'
  resources :users
  resources :recipes do
    resources :likes
  end
  resources :ingredients
  resources :favorites
  resources :likes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

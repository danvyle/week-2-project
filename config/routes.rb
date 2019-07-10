Rails.application.routes.draw do
  get 'recipes/search', to: 'recipes#search', as: "search"
  post 'search', to: 'recipes#search_results'
  get '/signup', to: "users#new"
  get '/login', to: "auth#new"
  post '/login', to:"auth#create"
  delete '/login', to:"auth#destroy"
  resources :users
  resources :recipes do
    resources :likes
  end
  resources :recipes do
    resources :favorites
  end
  resources :ingredients
  resources :favorites
  resources :likes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

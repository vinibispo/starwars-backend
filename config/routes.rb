Rails.application.routes.draw do
  resources :films
  resources :people
  resources :planets

  resources :casts, only: %i[create destroy]
  resources :scenarios, only: %i[create destroy]
  resources :users, only: %i[create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

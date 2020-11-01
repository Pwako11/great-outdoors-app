Rails.application.routes.draw do
  resources :reviews
  resources :parks
  resources :users, only: [:new, :create, :show, :edit, :update]
  
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"
  get "logout", to: "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

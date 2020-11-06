Rails.application.routes.draw do
  resources :reviews

  resources :parks do
    resources :reviews, shallow: true
  end 

  resources :users, only: [:new, :create, :show, :edit, :update]
  
  get "/", to: "parks#index", as: "home"
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"
  get "logout", to: "sessions#destroy", as: "logout"
  get '/auth/facebook/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Blog::Application.routes.draw do

  root to: "posts#index"
  
  get "sign_up" => "users#new", as: "sign_up"
  get "log_in" => "sessions#new", as: "log_in"
  get "log_out" => "sessions#destroy", as: "log_out"
  resources :users
  resources :posts
  resources :sessions

end

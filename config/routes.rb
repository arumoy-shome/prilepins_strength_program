Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations]
  #static pages routes
  root to: "static_pages#home", as: 'home'
  get "/about", to: "static_pages#about", as: 'about'
  get "/contact", to: "static_pages#contact", as: 'contact'
  #users routes
  get "/all_users", to: "users#index", as: "all_users"
  resources :users, only: [:show, :destroy] do
     resources :posts, only: [:create, :destroy]
     resources :workouts
   end

end

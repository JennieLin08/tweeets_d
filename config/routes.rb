Rails.application.routes.draw do
  resources :todos
  resources :posts
  # devise_for :users
  devise_for :users, controllers: {
    # sessions: 'users/sessions'
    registrations: 'users/registrations'
  }

  namespace :api do
    get '/newsapi', to: 'newsapis#index'
  end

  get 'admin/edit/:id', to: 'admin#edit', as: 'admin_edit'
  patch 'admin/update/:id', to: 'admin#update', as: 'admin_update'
  delete 'admin/delete/:id', to: 'admin#destroy', as: 'admin_destroy'
  
  root 'pages#home'
  get 'pages/admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

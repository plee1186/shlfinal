Rails.application.routes.draw do
  get 'signup' => 'users#new'
  get 'login' => 'sessions_controller#new'
  post 'login' => 'sessions_controller#create'
  delete 'logout' => 'sessions_controller#destroy'
  get 'profile' => 'user_specific#profile'
  get 'user_specific/list'
  get 'user_specific/add'
  post 'user_specific/create'
  get 'user_specific/newshout'
  post 'user_specific/createshout'
  delete 'user_specific/destroyshout'
  
  resources :challenges
  resources :users
  resources :shoutouts, only: [:index]

  root 'users#index'
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :challenges, only: [:index, :create, :show]
      resources :shoutouts, only: [:index, :create, :show, :destroy]
      resources :sessions, only: [:create]       
    end
  end
  
  
end

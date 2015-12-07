Rails.application.routes.draw do
  get 'signup' => 'users#new'
  get 'login' => 'sessions_controller#new'
  post 'login' => 'sessions_controller#create'
  delete 'logout' => 'sessions_controller#destroy'
  get 'profile' => 'user_specific#profile'
  get 'user_specific/list'
  get 'user_specific/add'
  post 'user_specific/create'
  
  resources :challenges
  resources :users
  resources :shoutouts

  root 'users#index'
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :challenges, only: [:index, :create, :show, :update, :destroy]
      resources :user_specific, only: [:profile, :create,] #get User profile, post User challenges
    end
  end
  
  
end

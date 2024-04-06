Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :blobs, only: [:show, :create]
      resources :users, only: [:create]
      post '/users/login', to: 'sessions#create'
      post '/users/register', to: 'users#create'
    end
  end
end

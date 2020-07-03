Rails.application.routes.draw do
    resources :users, only: [:index]
    resources :posts, only: [:index, :show, :create]
    resources :comments, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
        namespace :v1 do
            resources :users, only: [:create]
            #get '/users/', to: 'users#index'
            post '/login', to: 'auth#create'
            get '/profile', to: 'users#profile'

        end
    end

end

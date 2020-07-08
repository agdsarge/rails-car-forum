Rails.application.routes.draw do
    resources :users, only: [:index, :create, :destroy, :update]
    resources :posts, only: [:index, :show, :create, :destroy, :update]
    resources :comments, only: [:index, :create, :destroy, :update]
    resources :messages, only: [:show]
    resources :remarks, only: [:post]

    post '/messages/new', to: 'messages#search'
    get '/users/my_messages/:id', to: 'users#my_direct_messages'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
        namespace :v1 do
            resources :users, only: [:create]
            #get '/users/', to: 'users#index'
            post '/login', to: 'auth#create'
            get '/profile', to: 'users#profile'
            get '/token', to: 'auth#jwt_log_in' 

        end
    end

end

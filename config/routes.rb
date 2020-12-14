# Rails.application.routes.draw do
  # resources :entries
  # resources :songs
  # resources :users
  Rails.application.routes.draw do


  post "/api/v1/login", to: "api/v1/sessions#create"
  post "/api/v1/signup", to: "api/v1/users#create"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"
  post "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  post "/api/v1/get_user_entries", to: "api/v1/entries#get_user_entries"
    namespace :api do
      namespace :v1 do
        resources :users
        resources :entries do 
            resources :comments
        end 
        resources :songs do
          collection do
            post :search
          end
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

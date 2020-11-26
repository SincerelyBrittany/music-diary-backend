# Rails.application.routes.draw do
  # resources :entries
  # resources :songs
  # resources :users

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :songs do
          collection do
            get :top_100
            get :random
            get :search
          end
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'users#login'
      get '/users/:id/renting', to: 'users#renting'
      get '/users/:id/rentingout', to: 'users#rentingout'
      resources :users, only: [:show]
      resources :items, only: [:index, :show, :create, :update, :destroy] do
        resources :orders, only: [:create, :show]
        # collection do
        #   get "renting", to: "items#renting"
        #   get "rentingout", to: "items#rentingout"
        # end
      end
    end
  end
end

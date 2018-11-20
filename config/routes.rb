Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  get 'items/create'
  get 'items/update'
  get 'items/destroy'
  post '/login', to: 'login#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show, :create, :update, :destroy]

end

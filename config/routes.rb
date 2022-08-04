Rails.application.routes.draw do
  get '/countries' => 'countries#index'

  resources :users, only: [:index, :create, :show, :update]
  resources :negotiations, only: [:create]

end

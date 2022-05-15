Rails.application.routes.draw do
  # user
  get 'items/index'
  devise_for :users

  # Defines the root path route ("/")
  root "items#index"
end

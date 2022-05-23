Rails.application.routes.draw do
  # devise
  devise_for :users, skip: 'sessions', controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
  }
  devise_scope :user do
    get	'/users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post	'/users/sign_in', to: 'users/sessions#create', as: :user_session
    get	'/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  # root("/")
  root "items#index"

  # items
  resources :items do
    collection do
      get :search
      get :artists, to: 'items#get_artists'
      get :albums, to: 'items#get_albums'
    end
  end

  # artists
  resources :users do
    resources :artists, except: %i(show) do
      collection do
        get :confirm
        get :all, to: 'users#get_artists'
      end
    end
  end
  get '/artists/:id', to: 'artists#show', as: :artist_params

  # albums
  resources :users do
    resources :albums, except: %i(show) do
      collection do
        get :confirm
        get :all, to: 'users#get_albums'
      end
    end
  end
  get '/albums/:id', to: 'albums#show', as: :album_params

  # users
  get 'users/:id/profile', to: 'users#get_profile', as: :users_profile
  # get 'users/:id/artists', to: 'users#get_artist', as: :users_artist
  # get 'users/:id/albums', to: 'users#get_album', as: :users_album
end

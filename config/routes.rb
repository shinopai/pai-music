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
    end
  end

  # artists
  resources :users do
    resources :artists do
      collection do
        get :confirm
      end
    end
  end
end

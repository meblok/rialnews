Rails.application.routes.draw do
    resources :publications do
    resources :comments, only: [:create, :destroy]
    end
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
    root "publications#index"
  end

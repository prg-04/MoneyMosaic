Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  root 'categories#index'
  get '/splash', to: 'splash#index', as: 'splash'

  resources :categories do
    resources :expenses, only: [:new, :create]
  end
end

Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  resources :users, only: %i[show] do
    resources :addresses
      resources :professional_profiles do
        resources :agendas, except: [:index]
      end
    end
  end

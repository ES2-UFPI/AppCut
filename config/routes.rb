Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                     }

  resources :users, only: %i[show] do
    resources :addresses
    resources :professional_profiles do
      resources :agendas, except: [:index]
      resources :rates, only: [:new, :create]
    end
  end

  resources :professional_profiles, only: %i[show] do
    resources :agendas, only: %i[index show destroy] do
      resources :haircut_schedules, except: %i[index]
    end
  end

  resources :contacts, only: %i[index new create destroy]
  resources :chats, only: %i(index show) do
    resources :messages, only: :create, defaults: { format: :js }
  end
end

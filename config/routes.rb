Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :users, only: %i[show] do
    resources :addresses
  end
end

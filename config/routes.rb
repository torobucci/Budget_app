Rails.application.routes.draw do
  devise_for :users

  # root "categories#index"

  resources :categories, only: %i[index show new create] do
    resources :payments, only: %i[index new create]
  end

  root to: 'users#index'
end

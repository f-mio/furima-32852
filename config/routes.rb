Rails.application.routes.draw do
  devise_for :users

  resource :items, only: [:index, :new, :create]

  root to: 'items#index'
end

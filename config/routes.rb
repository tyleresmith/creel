Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root "home#index"
  resources :users, only: [:index, :show]
  # resources :trips do
  #   resources :items, only: [:new, :edit]    
  # end

  # resources :catch, only: [:create, :delete, :show]
  resources :trips
  resources :catches
  resources :fish, only: [:index, :show, :update, :destroy, :create]
end

Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root "home#index"
  
  # resources :trips do
  #   resources :items, only: [:new, :edit]    
  # end

  # resources :catch, only: [:create, :delete, :show]
  resources :fish, only: [:index, :show, :update, :destroy, :create]
end

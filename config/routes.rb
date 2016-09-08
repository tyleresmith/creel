Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root "home#index"
  resources :users, only: [:index, :show]
  resources :trips do
    resources :catches, only: [:new, :edit, :show, :update, :destroy, :create]    
  end

  # resources :catch, only: [:create, :delete, :show]
  resources :trips
  resources :fish, only: [:index, :show, :update, :destroy, :create]
  get '/fish/:id/favorite' => 'fish#favorite'
end

Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :dangers, only: [:index, :new, :create, :show, :update, :edit, :destroy]
  resources :places, only: [:index, :new, :create, :show, :update, :edit, :destroy]
end

Rails.application.routes.draw do
  devise_for :users
  root to: "dangers#index"
  resources :dangers, only: [:new, :create, :show, :update, :edit, :destroy]
end

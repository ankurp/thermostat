Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # root to: 'admin/dashboard#index'
  root to: 'static#home'

  resources :readings, only: [:create]
end

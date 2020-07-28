require "resque_web"

Rails.application.routes.draw do
  mount ResqueWeb::Engine => "/resque_web"
  resources :status_updates
  resources :animal_profiles
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :shelters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'about' => 'welcome#about'
end

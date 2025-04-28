Rails.application.routes.draw do
  get 'attendances/attend'
  get 'attendances/show'
  devise_for :users

  resources :attendances
  resources :events
  resources :profiles
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'events#index'
end

Rails.application.routes.draw do
  get 'attendances/attend'
  get 'attendances/show'
  devise_for :users

  # resources :attendances
  post 'create_attendance', to: 'attendances#create'
  resources :attendances
  resources :events
  resources :profiles
  root 'events#index'
end

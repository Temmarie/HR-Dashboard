Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "dashboard#home"
  resources :onboarding_tasks, only: [:update, :index]
  resources :employees, only: [:index]
  get "dashboard" => "dashboard#index", as: :dashboard
  get "up" => "rails/health#show", as: :rails_health_check
end

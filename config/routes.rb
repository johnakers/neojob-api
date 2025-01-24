Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'users#index'

  resources :users, only: %i[create show update destroy]
  resources :sessions, only: %i[create destroy]
  resources :job_applications, only: %i[index create show update destroy]
end

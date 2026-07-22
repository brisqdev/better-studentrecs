Rails.application.routes.draw do
  # Sets the login page as the application landing page at the / index route
  root "sessions#new"

  # Standard authentication resource routes
  resource :session
  resources :passwords, param: :token
  get "up" => "rails/health#show", as: :rails_health_check
end
Rails.application.routes.draw do
  # If a signed session cookie exists, dynamically redirect / to /dashboard
  constraints ->(request) { request.cookie_jar.signed[:session_id].present? } do
    root to: redirect("/dashboard"), as: :authenticated_root
  end

  # If no session exists, / serves the login view
  root to: "sessions#new"

  # Distinct Dashboard Route
  get "/dashboard", to: "dashboard#index", as: :dashboard

  # Standard authentication routes (Excluding /session/new)
  resource :session, except: [ :new ]
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check
end

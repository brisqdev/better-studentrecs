Rails.application.routes.draw do
  # get "applicantdashboard/index"
  # get "teacherdashboard/index"
  # get "counselordashboard/index"
  # get "staffdashboard/index"
  # get "admindashboard/index"

  # FAQs page
  get "/faqs", to: "faqs#index", as: :faqs

  # If a signed session cookie exists, dynamically redirect / to /dashboard
  constraints ->(request) { request.cookie_jar.signed[:session_id].present? } do
    root to: redirect("/dashboard"), as: :authenticated_root
  end

  # If no session exists, / serves the login view
  root to: "sessions#new"

  # Distinct Dashboard Routes
  get "/dashboard", to: "dashboard#index", as: :dashboard

  get "/admindashboard", to: "admindashboard#index", as: :admindashboard
  delete "/admindashboard/users/:id", to: "admindashboard#delete_staff", as: :delete_staff
  post "/admindashboard/users/:email_address/:password", to: "admindashboard#create_staff", as: :create_staff

  get "/staffdashboard", to: "staffdashboard#index", as: :staffdashboard

  get "/counselordashboard", to: "counselordashboard#index", as: :counselordashboard

  get "/teacherdashboard", to: "teacherdashboard#index", as: :teacherdashboard

  get "/applicantdashboard", to: "applicantdashboard#index", as: :applicantdashboard

  # Standard authentication routes (Excluding /session/new)
  resource :session, except: [ :new ]
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check
end

class SessionsController < ApplicationController
  # Allows guests to view the root login page and submit credentials
  allow_unauthenticated_access only: [ :new, :create ]
  
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to root_url, alert: "Try again later." }

  def new
    # Renders login view on the / index path
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for(user)
      redirect_to dashboard_path, notice: "Logged in successfully!"
    else
      redirect_to root_url, alert: "Invalid credentials. Please try again."
    end
  end

  def destroy
    terminate_session
    redirect_to root_url, notice: "Logged out successfully!"
  end
end

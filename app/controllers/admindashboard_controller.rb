class AdmindashboardController < ApplicationController
  before_action :ensure_admin!, only: [ :delete_staff, :create_staff ]

  def index
    user = Current.user

    if user.nil?
      redirect_to root_url, alert: "Please log in first."
      nil
    elsif user.role != "system_admin"
      redirect_to dashboard_url
    end

    @admissionsStaff = User.where(role: "admissions_officer")
  end


  # Staff Management Functions

  def delete_staff
    User.find(params[:id]).destroy

    # Redirect back to admin dashboard path
    redirect_to admindashboard_path, notice: "User successfully removed."
  end

  def create_staff
    User.create(email_address: params[:email_address], password: params[:password], role: "admissions_officer")

    # Redirect back to admin dashboard path
    redirect_to admindashboard_path, notice: "User successfully created."
  end

  private

  def ensure_admin!
    unless user&.role == "system_admin"
      # Redirect to root path as non-authorized user
      redirect_to root_path, alert: "Not authorized."
    end
  end
end

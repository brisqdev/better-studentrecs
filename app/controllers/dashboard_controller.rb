class DashboardController < ApplicationController
  def index
    user = Current.user

    if user.nil?
      redirect_to root_url, alert: "Please log in first."
      return
    end

    # Specific Controllers manage dashboard page
    case user.role
    when "system_admin"
      # System Admin Dashboard Route
      redirect_to admindashboard_path
    when "admissions_officer"
      # Admissions Officer Dashboard Route
      redirect_to staffdashboard_path
    when "school_counselor"
      # School Counselor Dashboard Route
      redirect_to counselordashboard_path
    when "teacher"
      # Teacher Dashboard Route
      redirect_to teacherdashboard_path
    when "applicant"
      # Applicants Dashboard Page
      render :index
    else
      # Invalid Role Management
      render :invalid_role
    end
  end
end

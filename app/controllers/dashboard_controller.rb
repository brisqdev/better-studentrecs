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
      AdmindashboardController.action(:index).call(request.env)
    when "admissions_officer"
      # Admissions Officer Dashboard Route
      StaffdashboardController.action(:index).call(request.env)
    when "school_counselor"
      # School Counselor Dashboard Route
      CounselordashboardController.action(:index).call(request.env)
    when "teacher"
      # Teacher Dashboard Route
      TeacherdashboardController.action(:index).call(request.env)
    when "applicant"
      # Applicants Dashboard Route
      ApplicantdashboardController.action(:index).call(request.env)
    else
      # Invalid Role Management
      render :invalid_role
    end
  end
end

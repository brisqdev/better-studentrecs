class CounselordashboardController < ApplicationController
  def index
    if user.nil?
      redirect_to root_url, alert: "Please log in first."
      nil
    elsif user.role != "school_counselor"
      redirect_to dashboard_url
    end
  end
end

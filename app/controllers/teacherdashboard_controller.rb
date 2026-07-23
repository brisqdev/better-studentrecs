class TeacherdashboardController < ApplicationController
  def index
    if user.nil?
      redirect_to root_url, alert: "Please log in first."
      nil
    elsif user.role != "teacher"
      redirect_to dashboard_url
    end
  end
end

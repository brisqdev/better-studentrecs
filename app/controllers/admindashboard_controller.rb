class AdmindashboardController < ApplicationController
  def index
    user = Current.user

    if user.nil?
      redirect_to root_url, alert: "Please log in first."
      nil
    elsif user.role != "system_admin"
      redirect_to dashboard_url
    end
  end
end

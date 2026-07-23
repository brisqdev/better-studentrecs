class ApplicationController < ActionController::Base
  include Authentication

  helper_method :user

  def user
    Current.user
  end

  allow_browser versions: :modern
  stale_when_importmap_changes
end

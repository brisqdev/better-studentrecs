class ApplicationController < ActionController::Base
  include Authentication

  user = User.find_by(id: session[:user_id])

  allow_browser versions: :modern
  stale_when_importmap_changes
end

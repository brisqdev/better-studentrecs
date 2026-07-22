class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Allow non-logged in users to access the homepage
  allow_unauthenticated_access only: :index

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end

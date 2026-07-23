class FaqsController < ApplicationController
  # Allow unauthenticated users to view the FAQs page
  allow_unauthenticated_access

  def index
  end
end

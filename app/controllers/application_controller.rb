class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to vehicles_url
  end
end

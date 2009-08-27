# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :logged_in?
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def login
    CASClient::Frameworks::Rails::Filter.filter(self)
    users = TRUSTED_USERS.split(',')
    if !session[:cas_user].nil? && !users.include?(session[:cas_user])
      redirect_to :controller=>"displays", :action => "index"
    end
  end

  def logout
    reset_session
    redirect_to CASClient::Frameworks::Rails::Filter.client.logout_url(request.referer)
  end

  def logged_in?
    session[:cas_user] ? true : false
  end
end

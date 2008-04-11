# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '6c21b18c8ef5e2d90a2e761f7ec4b091'
  
  include AuthenticatedSystem
  
  before_filter :get_intro
  
  # gets the intro text for the top of the page
  def get_intro
    if logged_in?
      if current_user['show_'+params[:controller]+'_intro']
        @intro = System.get_intro_for params[:controller]
      end
    end
  end
  
end

class WelcomeController < ApplicationController

  def index
    unless current_user[:show_welcome_tab]
      redirect_to :controller => 'workouts'
    end
  end
  
end

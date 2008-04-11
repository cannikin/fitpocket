class SettingsController < ApplicationController

  before_filter :login_required

  def index
  end

  def edit
  end
  
  def update
    if current_user.update_attributes(params[:att] => params[:val])
      render :nothing => true
    end
  end

end

class VitalsController < ApplicationController

  before_filter :login_required

  def index
    list
    render :action => 'list'
  end
  
  def list
    @vitals = Vital.find_all_by_user_id(:current_user.id, :order => 'created_at desc')
  end

  def create
    # fake the sleep parameter
    if request.post?
      params[:vital][:sleep] = params[:sleep_hours].to_f + params[:sleep_minutes].to_f
      @vital = Vital.new(params[:vital])
      @vital.user_id = current_user.id
      if @vital.save
        redirect_to :action => 'index'
      else
        @help = System.find(1)
        render :action => 'new'
      end
    else
      redirect_to :action => 'new'
    end
  end

  def new
    @vital = Vital.new
    @help = System.find(1)
  end

  def show
    @vital = Vital.find(params[:id])    # make sure user is allowed to do this
  end

  def update
    @vital = Vital.find(params[:id])  # make sure user is allowed to do this
    if @vital.update_attributes(params[:vital])
      redirect_to :action => 'show', :id => @vital.id
    else
      render :action => 'edit'
    end
  end

  def edit
    @vital = Vital.find(params[:id])
  end

  def destroy
    Vital.delete(params[:id])   # make sure user is allowed to do this
  end
end

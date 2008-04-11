class ActsController < ApplicationController

  before_filter :login_required
  
  def index
  end

  def list
  end

  def new
    @act = Act.new
    @act.id = session[:workout].acts.size + 1
    @exercises = {  :weight => Exercise.find_all_by_category('weight', :order => 'name'), 
                    :cardio => Exercise.find_all_by_category('cardio', :order => 'name') }
    render :layout => false
  end

  def create
    # create a new act
    @act = Act.new(params[:act])
    @act.id = params[:act][:id]
    
    # set some defaults if they weren't set manually
    if @act.exercise.category == 'weight' && @act.value_2 != nil && @act.value_3 == nil
      @act.value_3 = 1
    end
    
    if @act.valid?
      # if the act is valid, set its id and append it onto the workout session variable
      session[:workout].acts << @act
      # get the id of the act we just created, and add a url variable saying that this is an in-session workout
      render :action => 'show', :id => @act.id, :temp => 'true', :layout => false
    else
      render :text => params.inspect
    end
  end

  def edit
    @act = session[:workout].acts.find { |act| act.id = params[:id] }
  end

  def update
    @act = session[:workout].acts.find { |act| act.id = params[:id] }
    @act.exercise_id = params[:exercise_id]
    @act.value_1 = params[:value_1]
    @act.value_2 = params[:value_2]
    @act.value_3 = params[:value_3]
    @act.notes = params[:notes]
    
    if @act.valid?
      render :action => 'show', :id => @act.id, :temp => true, :layout => false
    else
      render :action => 'edit'
    end
  end

  def show
    if params[:temp]
      # return the act that matches params[:id]
      @act = session[:workout].acts.find { |act| act.id = params[:id] }
    else
      @act = Act.find(params[:id])
    end
  end

  def destroy
    Act.delete(params[:id])
    render :nothing => true
  end
end

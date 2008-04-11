class WorkoutsController < ApplicationController

  before_filter :login_required

  def index
    list
    render :action => 'list'
  end
  
  def list
    @workouts = Workout.find_all_by_user_id(current_user.id, :order => 'created_at desc')
  end

  def create
    @workout = session[:workout]
    if @workout.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def new
    # create a temporary workout in session to add actions to
    unless session[:workout]
      session[:workout] = Workout.new({ :user_id => current_user.id })
    end
    @workout = session[:workout]
  end
  
  def clear
    session[:workout] = nil
    redirect_to :action => "index"
  end

  def show
    @workout = Workout.find(params[:id])
    @previous = Workout.find_previous_entry(@workout.created_at)
    @next = Workout.find_next_entry(@workout.created_at)
  end

  def update
    @workout = session[:workout]
    
    # if there are acts
    unless @workout.acts.empty?
      @workout.acts.each do |act|
        if act.exercise
          # remove the id so ActiveRecord can set one itself
          act.id = nil
        else
          # remove the act altogether if there's no exercise assigned to it
          act = nil unless act.exercise
        end
      end
      
      if @workout.save
        session[:workout] = nil
        redirect_to :action => 'index'
      else
        # there was a problem trying to save
        render :action => 'new'
      end
      
    else
      # there are no acts for this workout
      render :action => 'new'
    end
  end

  def destroy
  end
  
end

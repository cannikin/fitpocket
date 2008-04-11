class ExercisesController < ApplicationController
  
  before_filter :login_required
  
  def index
    list
    render :action => 'list'
  end
  
  def list
    @exercises = Exercise.find :all, :order => 'name'
  end

  def create
    @exercise = Exercise.new(params[:exercise])
    @exercise.user_id = current_user.id
    if @exercise.save
      # any specific page to return to?
      if params[:return_to]
        redirect_to params[:return_to]
      else
        redirect_to :action => 'index'
      end
    else
      render :action => 'new'
    end
  end

  def new
    @exercise = Exercise.new
  end

  def show
    @exercise = Exercise.find params[:id]   # make sure user is allowed to view this exercise
  end

  def update
    @exercise = Exercise.find(params[:id])  # make sure user is allowed to edit this exercise
    if @exercise.update_attributes(params[:exercise])
      redirect_to :action => 'show', :id => exercise.id
    else
      render :action => 'edit'
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])   # make sure user is allowed to edit this exercise
  end

  def destroy
    Exercise.delete(params[:id])  # make sure user is allowed to delete this exercise
  end
end
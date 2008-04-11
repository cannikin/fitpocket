class Admin::ExercisesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @exercise_pages, @exercises = paginate :exercises, :per_page => 10
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(params[:exercise])
    if @exercise.save
      flash[:notice] = 'Exercise was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update_attributes(params[:exercise])
      flash[:notice] = 'Exercise was successfully updated.'
      redirect_to :action => 'show', :id => @exercise
    else
      render :action => 'edit'
    end
  end

  def destroy
    Exercise.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end

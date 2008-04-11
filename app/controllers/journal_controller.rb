class JournalController < ApplicationController

  before_filter :login_required

  def index
    list
    render :action => 'list'
  end
  
  def list
    @journals = Journal.find_all_by_user_id(session[:user_id], :order => 'created_at desc')
  end

  def create
    @journal = Journal.new(params[:journal])
    @journal.user_id = session[:user_id]
    if @journal.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def new
    @journal = Journal.new
  end

  def show
    @journal = Journal.find(params[:id])    # make sure this user is allowed to see this journal entry
    @previous = Journal.find_previous_entry(@journal.created_at)
    @next = Journal.find_next_entry(@journal.created_at)
  end

  def update
    @journal = Journal.find(params[:id])    # make sure this user is allowed to see this journal entry
    if @journal.update_attributes(params[:journal])
      redirect_to :action => 'show', :id => journal.id
    else
      render :action => 'edit'
    end
  end

  def edit
    @journal = Journal.find(params[:id])    # make sure the user is allowed to see this journal entry
  end

  def destroy
  end
end

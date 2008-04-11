class AccountController < ApplicationController

  # If you want "remember me" functionality, add this before_filter to Application Controller
  # before_filter :login_from_cookie
  # before_filter :login_required, :except => [:index,:login,:signup]

  layout nil, :only => [:login,:signup,:logout]

  def index
    redirect_to(:action => 'signup') unless logged_in?
  end

  def login
    render :layout => 'login' unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(:controller => 'welcome')
      flash[:notice] = "Logged in successfully"
    end
  end

  def signup
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    
    # create exercises for this user
    DefaultExercise.find(:all).each do |exercise|
      new_exercise = Exercise.new(:user_id => @user.id)
      new_exercise.name = exercise.name
      new_exercise.description = exercise.description
      new_exercise.category = exercise.category
      new_exercise.save
    end
    
    redirect_back_or_default(:controller => 'welcome')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'signup', :layout => false
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => 'account', :action => 'login')
  end
end
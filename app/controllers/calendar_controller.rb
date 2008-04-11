class CalendarController < ApplicationController

  before_filter :login_required

  def index
    previous_month = (29..31).collect do |day|
      { :number => day, :this_month => false }
    end
    this_month = (1..31).collect do |day|
      { :number => day, :this_month => true }
    end
    next_month = (1..1).collect do |day|
      { :number => day, :this_month => false }
    end
    @days = previous_month + this_month + next_month
    @days[13].merge!({ :events => { :workouts => [2,3], :vitals => [4], :journal => [2] }})
  end

  def create
  end

  def new
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end
end

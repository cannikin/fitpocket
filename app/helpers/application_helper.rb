# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def format_datetime(datetime,type=:long)
    if type == :short && Time.now - 0.5.days < datetime
      distance_of_time_in_words(Time.now, datetime) + ' ago'
    else
      datetime.strftime("%A, %b %e, %Y at %l:%M%p")
    end
  end
  
  def figure_next_and_previous_links(what)
    unless @previous.blank?
      previous_link = { :label => "Previous #{what.titlecase}", :icon => 'arrow_left', :link => url_for(:id => @previous.id) }
    else
      previous_link = nil
    end

    unless @next.blank?
      next_link = { :label => "Next #{what.titlecase}", :icon => 'arrow_right', :link => url_for(:id => @next.id), :icon_position => 'after' }
    else
      next_link = nil
    end
    [previous_link,next_link]
  end
  
end

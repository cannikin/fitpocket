module VitalsHelper
  
  UNITS = { :weight => ' lbs', 
            :heart_rate => ' bpm', 
            :sleep => ' hrs', 
            :body_fat => '%',
            :neck => '"',
            :chest => '"',
            :bicep => '"',
            :forearm => '"',
            :waist => '"',
            :hips => '"',
            :thigh => '"',
            :calf => '"' }
  ATTRIBUTES_TO_IGNORE = ['created_at','id','user_id','blood_pressure_systolic','blood_pressure_diastolic']
  TOTAL_SLEEP_HOURS = 15
  
  def format_vitals_for_list vitals
    output = ''
    vitals.attributes.sort.each do |key,value|
      # if this key isn't one to ignore, and isn't blank or zero
      if !ATTRIBUTES_TO_IGNORE.include?(key) && !value.nil? && !value.zero?
        output += '<span class="title">' + key.titlecase + ':</span> '
        # format values
        if value.is_a?(BigDecimal) && value % 1 == 0
          output += value.to_i.to_s
        elsif
          output += value.to_s
        end
        if UNITS[key.to_sym]
          output += UNITS[key.to_sym] + ', '
        else
          output += ', '
        end
      end
    end
    output
  end
  
  # creates the option tags for a dropdown of hours
  def option_tags_for_sleep_hours(num)
    output = ''
    if num.nil?
      num = 0
    end
    (0..TOTAL_SLEEP_HOURS).each do |i|
      output += "<option value=\"#{i}\""
      if i == num.floor
        output += ' selected="selected"'
      end
      output += ">#{pluralize(i,'hour')}</option>"
    end
    output
  end
  
  
  def option_tags_for_sleep_minutes(num)
    output = ''
    if num.nil?
      num = 0
    end
    [0.0,0.25,0.5,0.75].each do |i|
      output += "<option value=\"#{i}\""
      if i == (num % 1)
        output += ' selected="selected"'
      end
      output += ">#{(i*60).to_i} min</option>"
    end
    output  
  end
  
end

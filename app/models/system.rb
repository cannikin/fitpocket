# a table with a single row that contains system settings like intro text

class System < ActiveRecord::Base
  
  self.table_name = 'system'
  
  def self.get_intro_for page
    find(1)["#{page}_intro"]
  end
  
  def self.get_help_text
    find(:all, :select => ' vitals_weight_help, 
                            vitals_body_fat_help, 
                            vitals_heart_rate_help, 
                            vitals_sleep_help,
                            vitals_blood_pressure_help,
                            vitals_neck_help,
                            vitals_chest_help,
                            vitals_bicep_help,
                            vitals_forearm_help,
                            vitals_waist_help,
                            vitals_hips_help,
                            vitals_thigh_help,
                            vitals_calf_help')
  end
  
end

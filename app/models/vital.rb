class Vital < ActiveRecord::Base
  
  belongs_to :user
  validates_numericality_of :heart_rate, :blood_pressure_systolic, :blood_pressure_diastolic, :only_integer => true, :allow_nil => true, :message => 'must be a whole number (ex. 13, 50, 145)'
  validates_numericality_of :weight, :body_fat, :sleep, :neck, :chest, :bicep, :forearm, :waist, :hips, :thigh, :calf, :allow_nil => true
  
end

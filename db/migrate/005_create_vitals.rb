class CreateVitals < ActiveRecord::Migration
  def self.up
    create_table 'vitals' do |t|
      t.column  'created_at', :datetime
      t.column  'user_id', :integer
      t.column  'weight', :decimal, :precision => 5, :scale => 2      # lbs
      t.column  'body_fat', :decimal, :precision => 5, :scale => 2    # percent
      t.column  'blood_pressure_systolic', :integer                   # blood pressure
      t.column  'blood_pressure_diastolic', :integer                  # blood pressure
      t.column  'heart_rate', :integer                                # beats per minute
      t.column  'sleep', :decimal, :precision => 5, :scale => 2       # minutes
      t.column  'waist', :decimal, :precision => 5, :scale => 2       # inches
      t.column  'bicep', :decimal, :precision => 5, :scale => 2       # inches
      t.column  'forearm', :decimal, :precision => 5, :scale => 2     # inches
      t.column  'hips', :decimal, :precision => 5, :scale => 2        # inches
      t.column  'chest', :decimal, :precision => 5, :scale => 2       # inches
      t.column  'neck', :decimal, :precision => 5, :scale => 2        # inches
      t.column  'thigh', :decimal, :precision => 5, :scale => 2       # inches
      t.column  'calf', :decimal, :precision => 5, :scale => 2        # inches
    end
    
    add_index :vitals, :user_id
    
  end

  def self.down
    drop_table 'vitals'
  end
end

class CreateActs < ActiveRecord::Migration
  def self.up
    create_table 'acts' do |t|
      t.column  'created_at', :datetime
      t.column  'exercise_id', :integer
      t.column  'workout_id', :integer
      t.column  'notes', :text
      t.column  'value_1', :decimal, :precision => 5, :scale => 2    # weight in lbs. or time in minutes
      t.column  'value_2', :decimal, :precision => 5, :scale => 2    # reps or distance in miles
      t.column  'value_3', :decimal, :precision => 5, :scale => 2    # sets or speed in mph
    end
    
    add_index :acts, :workout_id
    add_index :acts, :exercise_id
    
  end

  def self.down
    drop_table 'acts'
  end
end

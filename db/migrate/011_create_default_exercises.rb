require 'active_record/fixtures' 

class CreateDefaultExercises < ActiveRecord::Migration
  def self.up
    create_table :default_exercises do |t|
      t.column  'name', :string
      t.column  'description', :text
      t.column  'category', :string, :default => 'weight'      # cardio | weight      
    end
    
    directory = File.join(File.dirname(__FILE__), "default_data") 
    Fixtures.create_fixtures(directory, "default_exercises") 
    
  end

  def self.down
    drop_table :default_exercises
  end
end

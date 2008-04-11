class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table 'workouts' do |t|
      t.column  'created_at', :datetime
      t.column  'name', :string
      t.column  'user_id', :integer
      t.column  'location_id', :integer
    end
    
    add_index :workouts, :user_id
    
  end

  def self.down
    drop_table 'workouts'
  end
end

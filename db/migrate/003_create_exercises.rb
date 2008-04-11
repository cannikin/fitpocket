class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table 'exercises' do |t|
      t.column  'created_at', :datetime
      t.column  'user_id', :integer
      t.column  'name', :string
      t.column  'description', :text
      t.column  'category', :string, :default => 'weight'      # cardio | weight
    end
    
    add_index :exercises, :user_id
    
  end

  def self.down
    drop_table 'exercises'
  end
end

# when a new user is created, duplicate all the system exercises into user exercises, then link
# them to the user via user_id.  This way users can edit the exercises all they want and
# they'll always be updating their own copy
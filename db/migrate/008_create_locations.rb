class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table 'locations' do |t|
      t.column  'created_at', :datetime
      t.column  'user_id', :integer
      t.column  'name', :string
    end
    
    add_index :locations, :user_id
    
  end

  def self.down
    drop_table 'locations'
  end
end

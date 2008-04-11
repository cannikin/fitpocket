class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table 'journals' do |t|
      t.column  'created_at', :datetime
      t.column  'user_id', :integer
      t.column  'entry', :text
    end
    
    add_index :journals, :user_id
    
  end

  def self.down
    drop_table 'journals'
  end
end

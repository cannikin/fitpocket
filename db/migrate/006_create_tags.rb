class CreateTags < ActiveRecord::Migration
  def self.up
    create_table 'tags' do |t|
      t.column  'created_at', :datetime
      t.column  'user_id', :integer
      t.column  'name', :string
    end
    
    add_index :tags, :user_id
    
  end

  def self.down
    drop_table 'tags'
  end
end

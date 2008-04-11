class Journal < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :entry
  
  # get the next entry before (in chronological order) than the specified date/time
  def self.find_previous_entry datetime
    find :first, :conditions => "created_at < '#{datetime.to_s(:db)}'", :order => 'created_at desc'
  end
  
  # get the next entry after (in chronological order) than the specified datetime
  def self.find_next_entry datetime
    find :first, :conditions => "created_at > '#{datetime.to_s(:db)}'", :order => 'created_at asc'
  end
  
end

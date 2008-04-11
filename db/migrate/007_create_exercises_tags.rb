class CreateExercisesTags < ActiveRecord::Migration
  def self.up
    create_table 'exercises_tags' do |t|
      t.column  'exercise_id', :integer
      t.column  'tag_id', :integer
    end
    
    add_index :exercises_tags, [:exercise_id, :tag_id], :unique => true
    
  end

  def self.down
    drop_table 'exercises_tags'
  end
end

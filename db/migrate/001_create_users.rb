class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users" do |t|
      t.column :login,                      :string
      t.column :email,                      :string
      t.column :crypted_password,           :string, :limit => 40
      t.column :salt,                       :string, :limit => 40
      t.column :created_at,                 :datetime
      t.column :updated_at,                 :datetime
      t.column :remember_token,             :string
      t.column :remember_token_expires_at,  :datetime
      t.column :first_name,                 :string
      t.column :last_name,                  :string
      t.column :gender,                     :string
      t.column :birthday,                   :date
      t.column :last_login,                 :datetime
      t.column :measurement,                :string, :default => 'standard'            # standard | metric
      t.column :show_workouts_intro,        :boolean, :default => 1
      t.column :show_vitals_intro,          :boolean, :default => 1
      t.column :show_calendar_intro,        :boolean, :default => 1
      t.column :show_journal_intro,         :boolean, :default => 1
      t.column :show_reports_intro,         :boolean, :default => 1
      t.column :show_exercises_intro,       :boolean, :default => 1
      t.column :show_settings_intro,        :boolean, :default => 1
      t.column :show_account_intro,         :boolean, :default => 1
      t.column :show_welcome_tab,           :boolean, :default => 1
    end
    
    # add_index :users, [:login, :crypted_password], :unique => true

    # add admin user
     User.create(  :password => 'admin',
                   :password_confirmation => 'admin',
                   :email => 'admin@fitpocket.com',
                   :first_name => 'Admin',
                   :last_name => 'Istrator',
                   :login => 'admin',
                   :gender => 'm',
                   :birthday => '1978-04-16')
                  
  end

  def self.down
    drop_table "users"
  end
end

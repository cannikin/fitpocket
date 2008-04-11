# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 12) do

  create_table "acts", :force => true do |t|
    t.datetime "created_at"
    t.integer  "exercise_id"
    t.integer  "workout_id"
    t.text     "notes"
    t.decimal  "value_1",     :precision => 5, :scale => 2
    t.decimal  "value_2",     :precision => 5, :scale => 2
    t.decimal  "value_3",     :precision => 5, :scale => 2
  end

  add_index "acts", ["exercise_id"], :name => "index_acts_on_exercise_id"
  add_index "acts", ["workout_id"], :name => "index_acts_on_workout_id"

  create_table "default_exercises", :force => true do |t|
    t.string "name"
    t.text   "description"
    t.string "category",    :default => "weight"
  end

  create_table "exercises", :force => true do |t|
    t.datetime "created_at"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "category",    :default => "weight"
  end

  add_index "exercises", ["user_id"], :name => "index_exercises_on_user_id"

  create_table "exercises_tags", :force => true do |t|
    t.integer "exercise_id"
    t.integer "tag_id"
  end

  add_index "exercises_tags", ["exercise_id", "tag_id"], :name => "index_exercises_tags_on_exercise_id_and_tag_id", :unique => true

  create_table "journals", :force => true do |t|
    t.datetime "created_at"
    t.integer  "user_id"
    t.text     "entry"
  end

  add_index "journals", ["user_id"], :name => "index_journals_on_user_id"

  create_table "locations", :force => true do |t|
    t.datetime "created_at"
    t.integer  "user_id"
    t.string   "name"
  end

  add_index "locations", ["user_id"], :name => "index_locations_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "system", :force => true do |t|
    t.text   "workouts_intro"
    t.text   "vitals_intro"
    t.text   "calendar_intro"
    t.text   "journal_intro"
    t.text   "reports_intro"
    t.text   "exercises_intro"
    t.text   "settings_intro"
    t.text   "account_intro"
    t.string "vitals_weight_help"
    t.string "vitals_body_fat_help"
    t.string "vitals_heart_rate_help"
    t.string "vitals_blood_pressure_help"
    t.string "vitals_sleep_help"
    t.string "vitals_neck_help"
    t.string "vitals_chest_help"
    t.string "vitals_bicep_help"
    t.string "vitals_forearm_help"
    t.string "vitals_waist_help"
    t.string "vitals_hips_help"
    t.string "vitals_thigh_help"
    t.string "vitals_calf_help"
  end

  create_table "tags", :force => true do |t|
    t.datetime "created_at"
    t.integer  "user_id"
    t.string   "name"
  end

  add_index "tags", ["user_id"], :name => "index_tags_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birthday"
    t.datetime "last_login"
    t.string   "measurement",                             :default => "standard"
    t.boolean  "show_workouts_intro",                     :default => true
    t.boolean  "show_vitals_intro",                       :default => true
    t.boolean  "show_calendar_intro",                     :default => true
    t.boolean  "show_journal_intro",                      :default => true
    t.boolean  "show_reports_intro",                      :default => true
    t.boolean  "show_exercises_intro",                    :default => true
    t.boolean  "show_settings_intro",                     :default => true
    t.boolean  "show_account_intro",                      :default => true
    t.boolean  "show_welcome_tab",                        :default => true
  end

  create_table "vitals", :force => true do |t|
    t.datetime "created_at"
    t.integer  "user_id"
    t.decimal  "weight",                   :precision => 5, :scale => 2
    t.decimal  "body_fat",                 :precision => 5, :scale => 2
    t.integer  "blood_pressure_systolic"
    t.integer  "blood_pressure_diastolic"
    t.integer  "heart_rate"
    t.decimal  "sleep",                    :precision => 5, :scale => 2
    t.decimal  "waist",                    :precision => 5, :scale => 2
    t.decimal  "bicep",                    :precision => 5, :scale => 2
    t.decimal  "forearm",                  :precision => 5, :scale => 2
    t.decimal  "hips",                     :precision => 5, :scale => 2
    t.decimal  "chest",                    :precision => 5, :scale => 2
    t.decimal  "neck",                     :precision => 5, :scale => 2
    t.decimal  "thigh",                    :precision => 5, :scale => 2
    t.decimal  "calf",                     :precision => 5, :scale => 2
  end

  add_index "vitals", ["user_id"], :name => "index_vitals_on_user_id"

  create_table "workouts", :force => true do |t|
    t.datetime "created_at"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "location_id"
  end

  add_index "workouts", ["user_id"], :name => "index_workouts_on_user_id"

end

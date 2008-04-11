class CreateSystem < ActiveRecord::Migration
  def self.up
    create_table 'system' do |t|
      t.column 'workouts_intro', :text
      t.column 'vitals_intro', :text
      t.column 'calendar_intro', :text
      t.column 'journal_intro', :text
      t.column 'reports_intro', :text
      t.column 'exercises_intro', :text
      t.column 'settings_intro', :text
      t.column 'account_intro', :text
      t.column 'vitals_weight_help', :string
      t.column 'vitals_body_fat_help', :string
      t.column 'vitals_heart_rate_help', :string
      t.column 'vitals_blood_pressure_help', :string
      t.column 'vitals_sleep_help', :string
      t.column 'vitals_neck_help', :string
      t.column 'vitals_chest_help', :string
      t.column 'vitals_bicep_help', :string
      t.column 'vitals_forearm_help', :string
      t.column 'vitals_waist_help', :string
      t.column 'vitals_hips_help', :string
      t.column 'vitals_thigh_help', :string
      t.column 'vitals_calf_help', :string
    end
    System.delete_all
    System.create ( 
      :workouts_intro =>
        %{<p>This is where you're going to record all of the exercises you perform during your workout. Select
          the exercise you performed and then enter the sets/reps/weight, if it's a weight-lifting exercises,
          or the time/distance if it's a cardio exercise. You can also enter any notes you'd like about each&mdash;
          how easy or hard the weight was, if you felt any pain anywhere (not good!), stuff like that.</p>
          <p>By default when you click on the <span class="section">Workouts</span> tab you'll be brought to the
          <span class="section">New Workout</span> page rather than the overview of your previous workouts. If you'd rather
          go right to the full list each time you can change your preference on the 
          <a href="/settings" class="section">Settings</a> page.</p>},
      :vitals_intro =>
        %{<p>Here is where you can collect stats about your body shape and size and measure how they change
          during the course of your workouts. None of the information is required so if you only want to
          track your weight that's all you need to fill in.</p>
          <p>You'll see a <img src="/images/icons/information.png" alt="" /> icon next to each type of measurement.
          Roll over the icon with your mouse to see a description of how to peoperly measure that part
          of your body. By default when you click the <span class="section">Vitals</span> tab you will be taken to the
          <span class="section">Add Vitals</span> screen. If you would rather go to the <img src="/images/icons/book_open.png" alt="" />
          <span class="section">View All Vitals</span> page, you can change your preference on the <a href="/settings" class="section">Settings</a> page.</p>},
      :calendar_intro =>
        %{<p>Here's some information about calendars</p>},
      :journal_intro =>
        %{<p>Your journal is a place to record how you felt during your workout or as a place to keep
          your thoughts throughout the day. Think of it as a diary that your brother can't sneak and read!
          Clicking the <img src="/images/icons/book_open.png" alt="" /> <span class="section">View All Entries</span> 
          link will take you to a list of all your previous journal entries.</p>
          <p>By default, clicking the <span class="section">Journal</span> tab will bring you to the
          <span class="section">New Journal Entry</span> screen. If you would prefer that it always take you to
          your list of previous entries, you can change your preference on the 
          <a href="/settings" class="section"><span class="section">Settings</span></a> page. 
          (You may have noticed that we haven't provide a way to edit your previous entries. We think that's 
          the way it should be&mdash;no fair editing your thoughts a week after you wrote them!)</p>
          <p><span class="section">Tip:</span> For fancier formatting like 
          <em>italics</em> and <strong>bold,</strong> take a look at the <span class="section">Formatting Quick Reference</span> 
          to the right of the text entry area.</p>},
      :reports_intro =>
        %{<p>Reports and stuff here.</p>},
      :exercises_intro => 
        %{<p>Here's where you can see your list of exercises, view and edit details, and add new ones. 
          When you are adding <dfn title="Each individual exercise that you perform during a workout">activities</dfn>
          to a workout, this is the list of exercises that will be available.</p>
        <p>When you created your account we supplied you with a selection of exercises to get you started.
          There's a good mix of both <img src="/images/icons/weight.png" alt="" /> <span class="section">weight</span>
          and <img src="/images/icons/cardio.png" alt="" /> <span class="section">cardio</span> exercises in the list, 
          but you can always add your own by clicking the <img src="/images/icons/add.png" alt="" />
          <span class="section">Add an Exercise</span> link, edit any of your exercises by first clicking on the name, 
          then clicking the <img src="/images/icons/pencil.png" alt="" /> <span class="section">Edit this Exercise</span>
          link, or completely remove an exercise by clicking the <img src="/images/icons/delete.png" alt="" />
          icon on the far right of the exercise's name and description.</p>},
      :settings_intro =>
        %{<p>Settings instructions (may not be needed)</p>},
      :account_intro =>
        %{<p>Account instructions (may not be needed)</p>},
      :vitals_weight_help =>
        %{<strong>Weight</strong> Weighing yourself is easy, right? Yes, but there are a few things to keep 
          in mind. Try to weigh yourself at the same time every day&mdash;first thing in the morning after 
          using the bathroom and wearing just your undies is perfect.},
      :vitals_body_fat_help =>
        %{<strong>Body Fat %</strong> Measuring your body fat is simple&mdash;if you have a 
          scale that does it for you. Typically you enter your height and age, stand on it 
          barefoot and get your body fat percentage in a couple of seconds. There are other 
          methods to measure as well, such as pinch calipers and even a water displacement test.},
      :vitals_heart_rate_help =>
        %{<strong>Resting Heart Rate</strong> Your resting heart rate is a good measure of how strong your 
          heart is. The stronger it is, the less hard and less often it needs to pump. To best measure your 
          resting heart rate (also known as your basal metabolic rate), check your pulse when you wake up in 
          the morning, before you get out of bed. You can take it at your wrist using your index and middle 
          fingers, count the number of beats in 15 seconds and then multiply the number by 4.},
      :vitals_blood_pressure_help =>
        %{<strong>Blood Pressure</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.},
      :vitals_sleep_help =>
        %{<strong>Sleep</strong> Keep track of how many hours of sleep you got last night. 6-8 hours is good 
          for most adults, and you may want to try and get an additional hour of sleep for every hour of 
          strenuous workout you get during the day.},
      :vitals_neck_help =>
        %{<strong>Neck</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.},
      :vitals_chest_help =>
        %{<strong>Chest</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.},
      :vitals_bicep_help =>
        %{<strong>Bicep</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.},
      :vitals_forearm_help =>
        %{<strong>Forearm</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.},
      :vitals_waist_help =>
        %{<strong>Waist</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.},
      :vitals_hips_help =>
        %{<strong>Hips</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.},
      :vitals_thigh_help =>
        %{<strong>Thigh</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.},
      :vitals_calf_help =>
        %{<strong>Calf</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}
      )
  end

  def self.down
    drop_table 'system'
  end
end

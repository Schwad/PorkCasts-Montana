class CreateDailyRakeLogs < ActiveRecord::Migration
  def change
    create_table :daily_rake_logs do |t|
      t.integer :todays_work_time

      t.timestamps null: false
    end
  end
end

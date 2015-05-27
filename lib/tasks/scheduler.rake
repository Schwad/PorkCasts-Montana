require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

desc "This task is called by the Heroku scheduler add-on"


task :send_reminders => :environment do
  User.all.each do |user|
    puts "sending email..."
    user.send_test_email
    puts "done"
  end
end

task :daily_api_check => :environment do
  # @start_time = Time.now
  puts "starting daily API check at #{Time.now}"
  User.all.each do |user|
    puts 'Now querying for ' + user.email + '.....'
     user.queries.each do |query|
      if query.opt_out_email == false
        puts user.email + ' checking for new payments to ' + query.content + '.....'
        checks_checks(query)
        checks_credit_cards(query)
      end
    end
  end
end
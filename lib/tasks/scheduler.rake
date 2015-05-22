desc "This task is called by the Heroku scheduler add-on"
# task :update_feed => :environment do
#   puts "Updating feed..."
#   NewsFeed.update
#   puts "done."
# end

task :send_reminders => :environment do
  User.all.each do |user|
    puts "sending email..."
    user.send_test_email
    puts "done"
  end
end
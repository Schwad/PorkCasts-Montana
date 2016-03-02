require "#{Rails.root}/app/helpers/application_helper"
require 'action_view'
include ActionView::Helpers::NumberHelper
include ApplicationHelper

desc "This task is called by the Heroku scheduler add-on"


task :send_reminders => :environment do
  User.all.each do |user|
    puts "sending email..."
    user.send_test_email
    puts "done"
  end
end

task :tweet_porkcast => :environment do
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "NoAoXM0rin3H4cAnvQ9QiryU7"
    config.consumer_secret     = "gHb0ImsgApnwJB0oFweevYH744xiWeo3DE6v33EcrtXKAB4tz5"
    config.access_token        = "20441925-beI6LAZ6SBe5q8qCxZjUMJV4uAPfy9ZE2pWLQuBDp"
    config.access_token_secret = "Pb1AYeKZaLikgNznLRIfr8zLpXecYel87eDuFNODx1Pik"
  end
  @payment = "AHHHHHHHHHFDJSKLAFJKLDAS;JFKLASD;JFKL;DASJKLF;AJSDKL;FJDASKL;FJKLADS;JFKL;DASJFKL;ADSJFKL;ASDJKLF;ADSJKLFJDSAL;FFDSJFKLSDJFKLDSJFLKJDSLKFJDSLKFJKLDSFJKLDSJFLKDSJFLKDSJLKFDJKLSDFJKLFJKLDFSJKLDSJFKLDSJFLKSD"
  puts "processing...."
  while @payment.length > 140
    puts "Too long tweet, (length is #{@payment.length} retrying"
    @check = Check.all.sample
    @payee = []
    @check.payee.split(" ").each do |word|
      word = word[0] + word[1..-1].downcase
      @payee << word
    end
    @payee = @payee.join(" ")
    format_amount = "$" + number_with_precision(@check.amount, :precision => 2, :delimiter => ',').to_s

    @payment = "Montana paid #{format_amount} to #{@payee} on #{@check.payment_date.month}/#{@check.payment_date.day}/#{@check.payment_date.year} http://porkcast.herokuapp.com/static_pages/shared.#{@check.payee.gsub(" ", "%20")} #mtpol"
    puts @payment
  end

  client.update("#{@payment}")

end

task :email_user_new_feature => :environment do
  @users = User.all
  @users.each do |user|
    begin
      UserMailer.porkcast_version_release(user).deliver!
      puts "Sent email to #{@user.email}"
    rescue
      puts "We saw an error on there, uh oh!"
    end
  end
end

task :daily_api_check => :environment do
  @start_time = Time.now

  puts "starting daily API check at #{Time.now}"
  User.all.each do |user|
    @reveal_all = []
    puts 'Now querying for ' + user.email + '.....'
     user.queries.each do |query|
      if query.opt_out_email == false
        puts user.email + ' checking for new payments to ' + query.content + '.....'
        @reveal_checks = checks_checks(query)
        @reveal_cards = checks_credit_cards(query)

        if @reveal_checks.class == Array
          @reveal_checks.each do |element|
            @reveal_all << element
          end
        end
        if @reveal_cards.class == Array
          @reveal_cards.each do |element|
            @reveal_all << element
          end
        end
      end
    end
     if @reveal_all.length > 0
        UserMailer.query_match(user, @reveal_all).deliver!
        puts "email should have sent!"
      end
  end
  @end_time = Time.now
  puts "Daily api check took #{@end_time - @start_time}"
end

task :first_email_update => :environment do
  @users = User.all
  @users.each do |user|
    UserMailer.admin_test(user).deliver!
  end
end
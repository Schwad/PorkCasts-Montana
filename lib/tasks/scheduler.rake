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

task :build_mega_database => :environment do
  #The purpose of this task is to build out the database to improve twitter functionality
  def sanitize_query(query)
    query.content.upcase
  end

  def credit_card_search(query)
    query = sanitize_query(query)
    client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
    return client.get("7824-pmwm", {:merchant => "#{query}"})
  end

  def creates_credit_cards(query)
    @credit_cards = credit_card_search(query)
    @credit_cards.each do |credit_card|
      CreditCard.create(
        :query_id => query.id,
        :department => credit_card.department,
        :amount => credit_card.amount,
        :merchant => credit_card.merchant,
        :billing_date => credit_card.billing_date
        )
        puts "new credit card with #{credit_card.merchant}, #{credit_card.amount} from #{credit_card.department}"
    end
  end

  puts "Starting with cards reading..."
  file = File.read('rows_for_major_db_cards.json')
  puts "Now turning into JSON...."
  data = JSON.parse(file)
  puts "Now to build all these credit cards... oh boy"
  counter = 0
  data["data"].each do |element|
    puts "Now on #{counter} with #{element[11]}"
    if Query.where("content = ?", element[11]).length == 0
      @query = Query.create(
        :content => element[11],
        :opt_out_email => false,
        :user_id => 2
        )
    end
    puts "Built query! Now building credit cards"

    CreditCard.create(
      :query_id => Query.where("content = ?", element[11]).first.id,
      :department => element[10],
      :amount => element[13],
      :merchant => element[11],
      :billing_date => element[12]
      )
    puts "new credit card with #{element[11]}, #{element[13]} from #{element[10]}"

    puts "built credit cards! moving on!"
    counter += 1
  end

end

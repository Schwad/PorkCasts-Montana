class CheckQueryTask < ActiveRecord::Base
  include Delayed::RecurringJob
  run_every 1.day
  run_at '11:00am'
  timezone 'US/Pacific'
  queue 'slow-jobs'
  def perform
    Query.all.each do |query|
        @credit_cards = credit_card_search(query)
        @checks = credit_card_search(query)
        @checks.each do |check|
          if check
    end
  end
end


  def credit_card_search(query)
    sanitize_query(query)
    client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
    return client.get("dvui-wnnh", {:merchant => "#{query}"})
  end

  def accts_payable_search(query)
     query = sanitize_query(query)
     client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
    return client.get("pjb4-8ve5", {:payee => "#{query}"})
  end
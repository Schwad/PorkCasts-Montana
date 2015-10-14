module ApplicationHelper

  def sets_hashtable
    file = File.read('app/assets/hashtable.json')
    data = JSON.parse(file)
    return data
  end

  def sets_brute_array
    file = File.read('app/assets/purearray.json')
    data = JSON.parse(file)
    return data
  end

  def fuzzy_match(query, string)
    query = query.upcase.strip
    string = string.upcase.strip
    if string == query
      true
    else
      false
    end
  end

  def checks_checks(query)
    @possible_checks = []
    @checks = accts_payable_search(query)
    @checks.each do |check|
     @possible_checks << Check.new(
          :query_id => query.id,
          :payment_category => check.payment_category,
          :department => check.department,
          :amount => check.amount,
          :payee => check.payee,
          :payment_date => check.payment_date
        )
    end
    puts 'Possible checks count: ' + @possible_checks.count.to_s
    puts 'Current checks count: ' + query.checks.count.to_s

    if @possible_checks.count == query.checks.count

      puts "...No new checks for #{query.content}!"
    elsif @possible_checks.count > query.checks.count
      puts "New checks for #{query.content}!"
      new_checks = @possible_checks.count - query.checks.count

      @revealed_checks = []

      while new_checks > 0
        @possible_checks[-new_checks].save
        @revealed_checks << [@possible_checks[-new_checks].payee, @possible_checks[-new_checks].amount, @possible_checks[-new_checks].payment_date]
        new_checks -= 1
      end
      return @revealed_checks
    elsif @possible_checks.count < query.checks.count
      puts "Possible error or fraud detected for #{query.content}, checks logs"
      UserMailer.fraud_mailer(query, @possible_checks.count, 1000000).deliver!
    elsif query.checks.count == 0
      puts "No checks at all for " + query.content
    else
      puts "ERROR, variable for #{query.content} not registering as less than, greater than or equal to the api check count"
    end
  end

  def checks_credit_cards(query)
    @possible_credit_cards = []
    @credit_cards = credit_card_search(query)
    @credit_cards.each do |credit_card|
      @possible_credit_cards << CreditCard.new(
        :query_id => query.id,
        :department => credit_card.department,
        :amount => credit_card.amount,
        :merchant => credit_card.merchant,
        :billing_date => credit_card.billing_date
        )

    end
    puts 'Possible card count: ' + @possible_credit_cards.count.to_s
    puts 'Current credit card count: ' + query.credit_cards.count.to_s

    if @possible_credit_cards.count == query.credit_cards.count
      puts "...No new credit_cards for #{query.content}!"
    elsif @possible_credit_cards.count > query.credit_cards.count
      puts "New credit_card for #{query.content}!"
      new_credit_card = @possible_credit_cards.count - query.credit_cards.count
      @revealed_cards = []
      while new_credit_card > 0
        @possible_credit_cards[-new_credit_card].save
        @revealed_cards << [ @possible_credit_cards[-new_credit_card].merchant, @possible_credit_cards[-new_credit_card].amount, @possible_credit_cards[-new_credit_card].billing_date]
        new_credit_card -= 1
      end
      return @revealed_cards
    elsif @possible_credit_cards.count < query.credit_cards.count
      UserMailer.fraud_mailer(query, 1000000, @possible_credit_cards.count).deliver!
      puts "Possible error or fraud detected for #{query.content}, check credit_card logs"
    elsif query.credit_cards.count == 0
      puts "No credit_card at all for " + query.content
    else
      puts "ERROR, variable for #{query.content} not registering as less than, greater than or equal to the api check count"
    end
  end

  def credit_card_search(query)
    query = sanitize_query(query)
    client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
    return client.get("7824-pmwm", {:merchant => "#{query}"})
  end

  def accts_payable_search(query)
     query = sanitize_query(query)
     client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
     return client.get("d7uw-2snd", {:payee => "#{query}"})
  end

  def sanitize_query(query)
    query.content.upcase
  end

  def creates_checks(query)
    @checks = accts_payable_search(query)
    @checks.each do |check|
      Check.create(
          :query_id => query.id,
          :payment_category => check.payment_category,
          :department => check.department,
          :amount => check.amount,
          :payee => check.payee,
          :payment_date => check.payment_date
        )
    end
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
    end
  end

  def credit_card_search(query)
    query = sanitize_query(query)
    client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
    return client.get("7824-pmwm", {:merchant => "#{query}"})
  end

  def accts_payable_search(query)
     query = sanitize_query(query)
     client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
     return client.get("d7uw-2snd", {:payee => "#{query}"})
  end

  def max_attributes_json
    puts "now setting max stuff"
    @max_checks = HTTParty.get "https://data.datamontana.us/resource/d7uw-2snd.json?$where=amount>10000000"
    @max_cards = HTTParty.get "https://data.datamontana.us/resource/7824-pmwm.json?$where=amount>100000"
     @max_cards.sort! { |a,b| a["amount"] <=> b["amount"] }
     @max_checks.sort! { |a,b| a["amount"] <=> b["amount"] }
  end
end

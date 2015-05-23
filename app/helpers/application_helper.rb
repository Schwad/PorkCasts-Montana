module ApplicationHelper

  def checks_checks(query)
    @checks = accts_payable_search(query)
    @checks.each do |check|
     @possible_check = Check.new(
          :query_id => query.id,
          :payment_category => check.payment_category,
          :department => check.department,
          :amount => check.amount,
          :payee => check.payee,
          :payment_date => check.payment_date
        )
      if query.checks.include?(@possible_check)
      else
        @possible_check.save
        UserMailer.query_match(query.user, @possible_check.payee, @possible_check.amount).deliver!
      end
    end
  end

  def checks_credit_cards(query)
    @credit_cards = credit_card_search(query)
    @credit_cards.each do |credit_card|
      @possible_credit_card = CreditCard.create(
        :query_id => query.id,
        :department => credit_card.department,
        :amount => credit_card.amount,
        :merchant => credit_card.merchant,
        :billing_date => credit_card.billing_date
        )
      if query.credit_cards.include?(@possible_credit_card)
      else
        @possible_credit_card.save
        UserMailer.query_match(query.user, @possible_credit_card.merchant, @possible_credit_card.amount).deliver!
      end
    end
  end

  def credit_card_search(query)
    query = sanitize_query(query)
    client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
    return client.get("dvui-wnnh", {:merchant => "#{query}"})
  end

  def accts_payable_search(query)
     query = sanitize_query(query)
     client = SODA::Client.new({:domain => "data.datamontana.us", :app_token => "lHUM5m1RF3QfiupyzYsQQSDrY"})
     return client.get("pjb4-8ve5", {:payee => "#{query}"})
  end

  def sanitize_query(query)
    query.content.upcase
  end
end

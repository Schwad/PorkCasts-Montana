class UsersController < ApplicationController
  def update
    if session[:editing_query]
      @query = Query.find(session[:editing_query])
      @query.content = params[:query][:content]
      session[:editing_query] = nil
      creates_checks(@query)
      creates_credit_cards(@query)
    else
      @query = Query.new(
        :content => params[:query][:content],
        :user_id => current_user.id
      )
      @query.save
      creates_checks(@query)
      creates_credit_cards(@query)
    end
      redirect_to user_queries_path(current_user.id)
  end

  #make into helpers
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
end

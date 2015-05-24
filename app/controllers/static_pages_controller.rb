class StaticPagesController < ApplicationController

  def index
    if current_user
      redirect_to user_queries_path(current_user.id)
    end
    @new_query = nil
    if session[:new_user_query]
      @new_query = Query.create(
          :content => session[:new_user_query],
          :user_id => current_user.id
        )
      session[:new_user_query] = nil
    end
    @user = User.new
    @query = Query.new
    # @user = User.new
    if @new_query
      creates_checks(@new_query)
      creates_credit_cards(@new_query)
    end
  end

  #need in helper method
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


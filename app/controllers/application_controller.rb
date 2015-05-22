class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



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

#FINISH EMAIL METHODS, THEN CHANGE THE SHOW PAGE TO ONLY DO QUERY.CHECKS ETC, AND THIS API METHOD ONLY RUNS ONCE A DAY.

  # def new_check_email(query)
  #   checks = accts_payable_search(query)
  #   checks.each do |check|
  #     if query.checks.include?(check)

  #     else
  #       Check.create(
  #         :query_id => query.id,
  #         :payment_category => ,
  #         :department => ,
  #         :amount => ,
  #         :payee => ,
  #         :payment_date
  #         )
  #     end
  #   end
  # end

  # def new_credit_card_check_email(query)
  #   credit_cards = credit_card_search(query)
  #   credit_cards.each do |credit_card|
  #     if query.credit_cards.include?(credit_card)

  #     else
  #       CreditCard.create(
  #         :query_id => query.id,
  #         :payment_category => ,
  #         :department => ,
  #         :amount => ,
  #         :merchant => ,
  #         :billing_date
  #         )
  #     end
  #   end


  # end

  def sanitize_query(query)
    query.content.upcase
  end

  private

  def require_current_user
    # don't forget that params is a string!!!
    if current_user
      unless params[:user_id] == current_user.id.to_s
        flash[:error] = "You're not authorized to view this"
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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

  def sanitize_query(query)
    query.upcase
  end
end

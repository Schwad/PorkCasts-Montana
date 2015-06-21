class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require "#{Rails.root}/app/helpers/application_helper"


#make services folder; service object.
#abstractions of business logic (aka api's).

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

  def what
    return "hi"
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

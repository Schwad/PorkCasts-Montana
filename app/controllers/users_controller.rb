class UsersController < ApplicationController
  require "#{Rails.root}/app/helpers/application_helper"
  include ApplicationHelper
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
      redirect_to user_query_path(current_user.id, @query.id)
  end


end

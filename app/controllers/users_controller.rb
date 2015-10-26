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

      if current_user.queries_daily_overload

          flash[:success] = "You have reached your daily limit of 50 queries. Please delete a query for more bandwidth or resume tomorrow."
          redirect_to user_queries_path(current_user.id)

      else
        if current_user.active_queries_overload

          @query = Query.create(
            :content => params[:query][:content],
            :opt_out_email => true,
            :user_id => current_user.id
            )
          flash[:success] = "You have now gone over your limit of 250 active queries to receive porkcast notifications; you will need to deactivate other queries' email notifications to enable others."
        else
          @query = Query.new(
            :content => params[:query][:content],
            :user_id => current_user.id
          )
          flash[:success] = "Query created!"
        end

        @query.save
        creates_checks(@query)
        creates_credit_cards(@query)
      end
    end

      redirect_to user_query_path(current_user.id, @query.id)
  end


end

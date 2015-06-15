class StaticPagesController < ApplicationController
  require "#{Rails.root}/app/helpers/application_helper"
  include ApplicationHelper
  def index
    max_attributes_json
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

  def shared
    @query = Query.create(
        :content => params[:format]
        )
    creates_checks(@query)
    creates_credit_cards(@query)
    @query.save

  end

  def about

  end

  def access_denied

  end

  def update

  end


end


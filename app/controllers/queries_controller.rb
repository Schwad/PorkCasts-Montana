class QueriesController < ApplicationController


  #Rails.application.config.my_config["hashtable"]["A"]
  #Rails.application.config.my_config["array"]

  before_action :require_current_user, except: :show
  require "#{Rails.root}/app/helpers/application_helper"
  include ApplicationHelper
  def index
    @user = User.find(params[:user_id])
    @queries = @user.queries.includes(:checks, :credit_cards)
    # USE THAT LATER
    # @queries = current_user.queries
  end

  def edit
    #use this for notifications
  end

  def create
    # I may need to use this for adding to user_query
    #KILLING-COPY-CODE-FLAG
    # @query_email = params[:query][:content]
    # if @query_email.include? "@"
    #   if User.exists?(:email => @query_email)
    #     redirect_to new_user_session_path
    #   else
    #     redirect_to new_user_registration_path
    #   end
    # else

    #   if current_user.active_queries_overload

    #     @query = Query.create(
    #       :content => @query_email,
    #       :opt_out_email => true
    #       )
    #     flash[:error] = "You have now gone over your limit of 250 active queries to receive porkcast notifications for"
    #   else
    #     @query = Query.create(
    #       :content => @query_email,
    #       )
    #   end
    #   creates_checks(@query)
    #   creates_credit_cards(@query)
    #   flash[:success] = "Query created!"
    #   redirect_to user_query_path(@query.id)
    # end
  end

  def destroy
    #removing user_query
    @query = Query.find(params[:id])
    @save_query = @query.id
    @query.destroy
    respond_to do |format|
      format.js {}
    end

  end

  def show
    @query = Query.find(params[:id])
    @query.includes(:checks, :credit_cards)
    if @query.checks.count == 0 && @query.credit_cards.count == 0
        flash[:success] = "Maybe you didn't get an exact match? Check out the autosuggest and try again!"
    end

  end

  def update
    #updating user query
    @query = Query.find(params["id"])
    @user = User.find(@query.user_id)

    if @query.opt_out_email == true
      if @user.active_queries_overload

      else
        @query.opt_out_email = false
      end
    else
      @query.opt_out_email = true
    end
    @query.save
    @query = Query.find(params["id"])
    respond_to do |format|
      format.js {
        if @user.active_queries_overload
          flash[:success] = "You have reached your limit of 250 porkcast notification-enabled queries. Please disable a query to enable others."
        end
      }
    end
  end
end

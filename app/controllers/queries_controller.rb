class QueriesController < ApplicationController
  before_action :require_current_user
  require "#{Rails.root}/app/helpers/application_helper"
  include ApplicationHelper
  def index
    @user = User.find(params[:user_id])
    @queries = @user.queries
    # USE THAT LATER
    # @queries = current_user.queries
  end

  def edit
    @query = Query.find(params[:id])
    @user = current_user
  end

  def update
    @query = Query.find(params[:id])
    @query.content = params[:query][:content]
    @query.save
    redirect_to user_query_path(@query.id)
  end

  def new
    @user = current_user
    @query = Query.new

  end

  def create
    @query_email = params[:query][:content]
    if @query_email.include? "@"
      if User.exists?(:email => @query_email)
        redirect_to new_user_session_path
      else
        redirect_to new_user_registration_path
      end
    else
      @query = Query.create(
        :content => @query_email
        )
      creates_checks(@query)
      creates_credit_cards(@query)
      flash[:success] = "Query created!"
      redirect_to user_query_path(@query.id)
    end
  end

  def destroy
    @query = Query.find(params[:id])
    @save_query = @query.id
    @query.destroy
    respond_to do |format|
      format.js {}
    end

  end

  def show
    @query = Query.find(params[:id])
  end

  def update
    @query = Query.find(params["id"])
    @user = User.find(@query.user_id)

    if @query.opt_out_email == true
      @query.opt_out_email = false
    else
      @query.opt_out_email = true
    end
    @query.save
    @query = Query.find(params["id"])
    respond_to do |format|
      format.js {}
    end
  end
end

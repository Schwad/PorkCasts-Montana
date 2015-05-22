class QueriesController < ApplicationController
  before_action :require_current_user

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
    redirect_to queries_path
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
    @query.destroy
    redirect_to user_queries_path(current_user.id)
  end

  def show
    @query = Query.find(params[:id])
    # @user = @query.user
    # @credit_cards = credit_card_search(@query)
    # @checks = accts_payable_search(@query)
  end

  def creates_checks(query)
    @checks = credit_card_search(query)
    binding.pry
    @checks.each do |check|
      Check.create(
          :query_id => query.id,
          :payment_category => check.payment_category,
          :department => check.deparment,
          :amount => check.amount,
          :payee => check.payee,
          :payment_date => check.payment_date.to_date.strftime("%m/%d/%Y")
        )
    end
  end

  def creates_credit_cards(query)
    @credit_cards = accts_payable_search(query)
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

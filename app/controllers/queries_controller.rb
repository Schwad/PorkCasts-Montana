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
      flash[:success] = "Query created!"
      redirect_to query_path(@query.id)
    end
  end

  def destroy
    @query = Query.find(params[:id])
    @query.destroy
    redirect_to queries_path
  end

  def show
    @query = Query.find(params[:id])
    @credit_cards = credit_card_search(@query.content)
    @checks = accts_payable_search(@query.content)
  end
end

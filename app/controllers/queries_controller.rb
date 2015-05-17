class QueriesController < ApplicationController
  def index
    @queries = Query.all
    # USE THAT LATER
    # @queries = current_user.queries
  end

  def edit
    @query = Query.find(params[:id])
  end

  def update
    @query = Query.find(params[:id])
    @query.content = params[:query][:content]
    @query.save
    redirect_to queries_path
  end

  def new
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
      Query.create(
        :content => @query_email
        )
      flash[:success] = "Query created!"
      redirect_to queries_path
    end
  end

  def show
    @query = Query.find(params[:id])
    @credit_cards = credit_card_search(@query.content)
    @checks = accts_payable_search(@query.content)
  end
end

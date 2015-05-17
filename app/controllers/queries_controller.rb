class QueriesController < ApplicationController
  def index
    @queries = current_user.queries
  end

  def create
    @query_email = params[:query][:content]
    if User.exists?(:email => @query_email)
      redirect_to new_user_session_path
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    @query = Query.find(params[:id])
    @credit_cards = credit_card_search(@query.content)
    @checks = accts_payable_search(@query.content)
  end
end
